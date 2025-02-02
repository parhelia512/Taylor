#include "mruby.h"
#include "mruby/array.h"
#include "mruby/class.h"
#include "mruby/data.h"
#include "raylib.h"
#include <cstdlib>

#include "mruby_integration/helpers.hpp"
#include "mruby_integration/models/colour.hpp"
#include "mruby_integration/struct_types.hpp"

#include "ruby/models/image.hpp"

struct RClass* Image_class;

void
setup_Image(mrb_state* mrb,
            mrb_value object,
            Image* image,
            int width,
            int height,
            int mipmaps,
            int format)
{
  ivar_attr_int(mrb, object, image->width, width);
  ivar_attr_int(mrb, object, image->height, height);
  ivar_attr_int(mrb, object, image->mipmaps, mipmaps);
  ivar_attr_int(mrb, object, image->format, format);
}

auto
mrb_Image_initialize(mrb_state* mrb, mrb_value self) -> mrb_value
{
  mrb_int width, height, mipmaps, format;
  mrb_get_args(mrb, "iiii", &width, &height, &mipmaps, &format);

  Image* image = static_cast<Image*> DATA_PTR(self);
  if (image) {
    mrb_free(mrb, image);
  }
  mrb_data_init(self, nullptr, &Image_type);
  image = static_cast<Image*>(malloc(sizeof(Image)));

  setup_Image(mrb, self, image, width, height, mipmaps, format);

  mrb_data_init(self, image, &Image_type);
  return self;
}

auto
mrb_Image_get_data(mrb_state* mrb, mrb_value self) -> mrb_value
{
  Image* image;

  Data_Get_Struct(mrb, self, &Image_type, image);
  mrb_assert(image != nullptr);

  Color* colours = LoadImageColors(*image);

  int size = image->width * image->height;

  mrb_value return_array = mrb_ary_new(mrb);

  for (int i = 0; i < size; i++) {
    mrb_value obj = mrb_obj_value(
      Data_Wrap_Struct(mrb, Colour_class, &Colour_type, &colours[i]));
    setup_Colour(mrb,
                 obj,
                 &colours[i],
                 colours[i].r,
                 colours[i].g,
                 colours[i].b,
                 colours[i].a);
    mrb_ary_push(mrb, return_array, obj);
    add_owned_object(&colours[i]);
  }

  return return_array;
}

auto
mrb_Image_set_width(mrb_state* mrb, mrb_value self) -> mrb_value
{
  attr_setter_int(mrb, self, Image_type, Image, width, width);
}

auto
mrb_Image_set_height(mrb_state* mrb, mrb_value self) -> mrb_value
{
  attr_setter_int(mrb, self, Image_type, Image, height, height);
}

auto
mrb_Image_set_mipmaps(mrb_state* mrb, mrb_value self) -> mrb_value
{
  attr_setter_int(mrb, self, Image_type, Image, mipmaps, mipmaps);
}

auto
mrb_Image_set_format(mrb_state* mrb, mrb_value self) -> mrb_value
{
  attr_setter_int(mrb, self, Image_type, Image, format, format);
}

void
append_models_Image(mrb_state* mrb)
{
  Image_class = mrb_define_class(mrb, "Image", mrb->object_class);
  MRB_SET_INSTANCE_TT(Image_class, MRB_TT_DATA);
  mrb_define_method(
    mrb, Image_class, "initialize", mrb_Image_initialize, MRB_ARGS_REQ(5));
  mrb_define_method(
    mrb, Image_class, "data", mrb_Image_get_data, MRB_ARGS_NONE());
  mrb_define_method(
    mrb, Image_class, "width=", mrb_Image_set_width, MRB_ARGS_REQ(1));
  mrb_define_method(
    mrb, Image_class, "height=", mrb_Image_set_height, MRB_ARGS_REQ(1));
  mrb_define_method(
    mrb, Image_class, "mipmaps=", mrb_Image_set_mipmaps, MRB_ARGS_REQ(1));
  mrb_define_method(
    mrb, Image_class, "format=", mrb_Image_set_format, MRB_ARGS_REQ(1));

  load_ruby_models_image(mrb);
}
