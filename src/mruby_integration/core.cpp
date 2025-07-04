#include "mruby.h"

#include "mruby_integration/core/drawing.hpp"
#include "mruby_integration/core/misc.hpp"
#include "mruby_integration/core/timing.hpp"

#include "ruby/core/buildkite_analytics.hpp"

void
append_core(mrb_state* mrb)
{
  append_core_drawing(mrb);
  append_core_misc(mrb);
  append_core_timing(mrb);

  load_ruby_core_buildkite_analytics(mrb);
}
