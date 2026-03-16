/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GLShader */

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


CAMLexport CAMLprim value ml_gsk_gl_shader_new_from_resource(value arg1)
{
CAMLparam1(arg1);

GskGLShader *obj = gsk_gl_shader_new_from_resource(String_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GskGLShader(obj));
}
CAMLexport CAMLprim value ml_gsk_gl_shader_get_uniform_type(value self, value arg1)
{
CAMLparam2(self, arg1);

GskGLUniformType result = gsk_gl_shader_get_uniform_type(GskGLShader_val(self), Int_val(arg1));
CAMLreturn(Val_GskGLUniformType(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_get_uniform_offset(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gsk_gl_shader_get_uniform_offset(GskGLShader_val(self), Int_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_get_uniform_name(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = gsk_gl_shader_get_uniform_name(GskGLShader_val(self), Int_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_get_resource(value self)
{
CAMLparam1(self);

const char* result = gsk_gl_shader_get_resource(GskGLShader_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_get_n_uniforms(value self)
{
CAMLparam1(self);

int result = gsk_gl_shader_get_n_uniforms(GskGLShader_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_get_n_textures(value self)
{
CAMLparam1(self);

int result = gsk_gl_shader_get_n_textures(GskGLShader_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_find_uniform_by_name(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gsk_gl_shader_find_uniform_by_name(GskGLShader_val(self), String_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gsk_gl_shader_compile(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gsk_gl_shader_compile(GskGLShader_val(self), GskRenderer_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
