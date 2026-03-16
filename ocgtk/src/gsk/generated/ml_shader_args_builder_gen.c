/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ShaderArgsBuilder */

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

/* Conversion functions for GskShaderArgsBuilder (opaque record with hidden fields) */
GskShaderArgsBuilder *GskShaderArgsBuilder_val(value v) {
  return *(GskShaderArgsBuilder **)Data_custom_val(v);
}

value Val_GskShaderArgsBuilder(const GskShaderArgsBuilder *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GskShaderArgsBuilder_option(const GskShaderArgsBuilder *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GskShaderArgsBuilder(ptr));
}


CAMLexport CAMLprim value ml_gsk_shader_args_builder_unref(value self)
{
CAMLparam1(self);

gsk_shader_args_builder_unref(GskShaderArgsBuilder_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_shader_args_builder_set_float(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gsk_shader_args_builder_set_float(GskShaderArgsBuilder_val(self), Int_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_shader_args_builder_set_bool(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gsk_shader_args_builder_set_bool(GskShaderArgsBuilder_val(self), Int_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_shader_args_builder_ref(value self)
{
CAMLparam1(self);

GskShaderArgsBuilder* result = gsk_shader_args_builder_ref(GskShaderArgsBuilder_val(self));
CAMLreturn(Val_GskShaderArgsBuilder(result));
}
