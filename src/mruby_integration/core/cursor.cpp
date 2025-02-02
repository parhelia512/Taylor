#include "mruby.h"
#include "raylib.h"

auto
mrb_show_cursor(mrb_state*, mrb_value) -> mrb_value
{
  ShowCursor();
  return mrb_nil_value();
}

auto
mrb_hide_cursor(mrb_state*, mrb_value) -> mrb_value
{
  HideCursor();
  return mrb_nil_value();
}

auto
mrb_cursor_hidden(mrb_state*, mrb_value) -> mrb_value
{
  return mrb_bool_value(IsCursorHidden());
}

auto
mrb_enable_cursor(mrb_state*, mrb_value) -> mrb_value
{
  EnableCursor();
  return mrb_nil_value();
}

auto
mrb_disable_cursor(mrb_state*, mrb_value) -> mrb_value
{
  DisableCursor();
  return mrb_nil_value();
}

auto
mrb_cursor_on_screen(mrb_state*, mrb_value) -> mrb_value
{
  return mrb_bool_value(IsCursorOnScreen());
}

void
append_core_cursor(mrb_state* mrb)
{
  mrb_define_method(
    mrb, mrb->kernel_module, "show_cursor", mrb_show_cursor, MRB_ARGS_NONE());
  mrb_define_method(
    mrb, mrb->kernel_module, "hide_cursor", mrb_hide_cursor, MRB_ARGS_NONE());
  mrb_define_method(mrb,
                    mrb->kernel_module,
                    "cursor_hidden?",
                    mrb_cursor_hidden,
                    MRB_ARGS_NONE());
  mrb_define_method(mrb,
                    mrb->kernel_module,
                    "enable_cursor",
                    mrb_enable_cursor,
                    MRB_ARGS_NONE());
  mrb_define_method(mrb,
                    mrb->kernel_module,
                    "disable_cursor",
                    mrb_disable_cursor,
                    MRB_ARGS_NONE());
  mrb_define_method(mrb,
                    mrb->kernel_module,
                    "cursor_on_screen?",
                    mrb_cursor_on_screen,
                    MRB_ARGS_NONE());
}
