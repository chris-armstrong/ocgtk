/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PathBuilder */

#include <gsk/gsk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GskPathBuilder (opaque record with hidden fields) */
GskPathBuilder *GskPathBuilder_val(value v) {
  return *(GskPathBuilder **)Data_custom_val(v);
}

value Val_GskPathBuilder(const GskPathBuilder *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskPathBuilder_option(const GskPathBuilder *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskPathBuilder(ptr));
}


CAMLexport CAMLprim value ml_gsk_path_builder_new(value unit)
{
CAMLparam1(unit);

GskPathBuilder *obj = gsk_path_builder_new();

CAMLreturn(Val_GskPathBuilder(obj));
}
CAMLexport CAMLprim value ml_gsk_path_builder_unref(value self)
{
CAMLparam1(self);

gsk_path_builder_unref(GskPathBuilder_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_to_path(value self)
{
CAMLparam1(self);

GskPath* result = gsk_path_builder_to_path(GskPathBuilder_val(self));
CAMLreturn(Val_GskPath(result));
}

CAMLexport CAMLprim value ml_gsk_path_builder_svg_arc_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam3(arg5, arg6, arg7);

gsk_path_builder_svg_arc_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Bool_val(arg4), Bool_val(arg5), Double_val(arg6), Double_val(arg7));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_svg_arc_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_svg_arc_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_svg_arc_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam3(arg5, arg6, arg7);

gsk_path_builder_rel_svg_arc_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Bool_val(arg4), Bool_val(arg5), Double_val(arg6), Double_val(arg7));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_svg_arc_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_rel_svg_arc_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_quad_to(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gsk_path_builder_rel_quad_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_move_to(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gsk_path_builder_rel_move_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_line_to(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gsk_path_builder_rel_line_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_html_arc_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gsk_path_builder_rel_html_arc_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_html_arc_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_rel_html_arc_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_cubic_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);

gsk_path_builder_rel_cubic_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_cubic_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_rel_cubic_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_conic_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gsk_path_builder_rel_conic_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_conic_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_rel_conic_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_rel_arc_to(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gsk_path_builder_rel_arc_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_ref(value self)
{
CAMLparam1(self);

GskPathBuilder* result = gsk_path_builder_ref(GskPathBuilder_val(self));
CAMLreturn(Val_GskPathBuilder(result));
}

CAMLexport CAMLprim value ml_gsk_path_builder_quad_to(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gsk_path_builder_quad_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_move_to(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gsk_path_builder_move_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_line_to(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gsk_path_builder_line_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_html_arc_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gsk_path_builder_html_arc_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_html_arc_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_html_arc_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_cubic_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam2(arg5, arg6);

gsk_path_builder_cubic_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5), Double_val(arg6));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_cubic_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_cubic_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_conic_to_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gsk_path_builder_conic_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gsk_path_builder_conic_to_bytecode(value * argv, int argn)
{
return ml_gsk_path_builder_conic_to_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gsk_path_builder_close(value self)
{
CAMLparam1(self);

gsk_path_builder_close(GskPathBuilder_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_arc_to(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gsk_path_builder_arc_to(GskPathBuilder_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_add_segment(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gsk_path_builder_add_segment(GskPathBuilder_val(self), GskPath_val(arg1), GskPathPoint_val(arg2), GskPathPoint_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_add_rounded_rect(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_path_builder_add_rounded_rect(GskPathBuilder_val(self), GskRoundedRect_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_add_reverse_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_path_builder_add_reverse_path(GskPathBuilder_val(self), GskPath_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_path_builder_add_path(value self, value arg1)
{
CAMLparam2(self, arg1);

gsk_path_builder_add_path(GskPathBuilder_val(self), GskPath_val(arg1));
CAMLreturn(Val_unit);
}
