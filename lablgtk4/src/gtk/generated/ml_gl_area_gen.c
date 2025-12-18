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

CAMLexport CAMLprim value ml_gtk_gl_area_set_required_version(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_gl_area_set_required_version(GtkGLArea_val(self), Int_val(arg1), Int_val(arg2));
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

CAMLexport CAMLprim value ml_gtk_gl_area_get_auto_render(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "auto-render");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_get_auto_render: property 'auto-render' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "auto-render", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_auto_render(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "auto-render");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_set_auto_render: property 'auto-render' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "auto-render", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_has_depth_buffer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-depth-buffer");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_get_has_depth_buffer: property 'has-depth-buffer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-depth-buffer", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_has_depth_buffer(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-depth-buffer");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_set_has_depth_buffer: property 'has-depth-buffer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-depth-buffer", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_has_stencil_buffer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-stencil-buffer");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_get_has_stencil_buffer: property 'has-stencil-buffer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-stencil-buffer", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_has_stencil_buffer(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-stencil-buffer");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_set_has_stencil_buffer: property 'has-stencil-buffer' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-stencil-buffer", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_use_es(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-es");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_get_use_es: property 'use-es' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-es", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_use_es(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGLArea *obj = (GtkGLArea *)GtkGLArea_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-es");
if (pspec == NULL) caml_failwith("ml_gtk_gl_area_set_use_es: property 'use-es' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-es", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
