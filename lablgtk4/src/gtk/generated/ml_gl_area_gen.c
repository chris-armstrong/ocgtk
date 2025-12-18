/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GLArea */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkGLArea */
#ifndef Val_GtkGLArea
#define GtkGLArea_val(val) ((GtkGLArea*)ext_of_val(val))
#define Val_GtkGLArea(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGLArea */


CAMLexport CAMLprim value ml_gtk_gl_area_new(value unit)
{
CAMLparam1(unit);
GtkGLArea *obj = gtk_gl_area_new();
CAMLreturn(Val_GtkGLArea(obj));
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_use_es(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gl_area_set_use_es(GtkGLArea_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_required_version(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_gl_area_set_required_version(GtkGLArea_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_has_stencil_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gl_area_set_has_stencil_buffer(GtkGLArea_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_has_depth_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gl_area_set_has_depth_buffer(GtkGLArea_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_auto_render(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gl_area_set_auto_render(GtkGLArea_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_allowed_apis(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gl_area_set_allowed_apis(GtkGLArea_val(self), GdkGLAPI_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_queue_render(value self)
{
CAMLparam1(self);

gtk_gl_area_queue_render(GtkGLArea_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_make_current(value self)
{
CAMLparam1(self);

gtk_gl_area_make_current(GtkGLArea_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_use_es(value self)
{
CAMLparam1(self);

gboolean result = gtk_gl_area_get_use_es(GtkGLArea_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_has_stencil_buffer(value self)
{
CAMLparam1(self);

gboolean result = gtk_gl_area_get_has_stencil_buffer(GtkGLArea_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_has_depth_buffer(value self)
{
CAMLparam1(self);

gboolean result = gtk_gl_area_get_has_depth_buffer(GtkGLArea_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_auto_render(value self)
{
CAMLparam1(self);

gboolean result = gtk_gl_area_get_auto_render(GtkGLArea_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_api(value self)
{
CAMLparam1(self);

GdkGLAPI result = gtk_gl_area_get_api(GtkGLArea_val(self));
CAMLreturn(Val_GdkGLAPI(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_allowed_apis(value self)
{
CAMLparam1(self);

GdkGLAPI result = gtk_gl_area_get_allowed_apis(GtkGLArea_val(self));
CAMLreturn(Val_GdkGLAPI(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_attach_buffers(value self)
{
CAMLparam1(self);

gtk_gl_area_attach_buffers(GtkGLArea_val(self));
CAMLreturn(Val_unit);
}
