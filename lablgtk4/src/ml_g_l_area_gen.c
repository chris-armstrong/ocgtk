/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GLArea */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_gl_area_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_gl_area_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_use_es(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gl_area_set_use_es(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_required_version(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_gl_area_set_required_version(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_has_stencil_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gl_area_set_has_stencil_buffer(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_has_depth_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gl_area_set_has_depth_buffer(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_error(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gl_area_set_error(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_auto_render(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gl_area_set_auto_render(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_set_allowed_apis(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_gl_area_set_allowed_apis(GtkWidget_val(self), GdkGLAPI_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_queue_render(value self)
{
CAMLparam1(self);


    gtk_gl_area_queue_render(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_make_current(value self)
{
CAMLparam1(self);


    gtk_gl_area_make_current(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_use_es(value self)
{
CAMLparam1(self);


    gboolean result = gtk_gl_area_get_use_es(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_required_version(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_gl_area_get_required_version(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_has_stencil_buffer(value self)
{
CAMLparam1(self);


    gboolean result = gtk_gl_area_get_has_stencil_buffer(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_has_depth_buffer(value self)
{
CAMLparam1(self);


    gboolean result = gtk_gl_area_get_has_depth_buffer(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_auto_render(value self)
{
CAMLparam1(self);


    gboolean result = gtk_gl_area_get_auto_render(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_api(value self)
{
CAMLparam1(self);


    GdkGLAPI result = gtk_gl_area_get_api(GtkWidget_val(self));
CAMLreturn(Val_GdkGLAPI(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_get_allowed_apis(value self)
{
CAMLparam1(self);


    GdkGLAPI result = gtk_gl_area_get_allowed_apis(GtkWidget_val(self));
CAMLreturn(Val_GdkGLAPI(result));
}

CAMLexport CAMLprim value ml_gtk_gl_area_attach_buffers(value self)
{
CAMLparam1(self);


    gtk_gl_area_attach_buffers(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_get_auto_render(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "auto-render", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_set_auto_render(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "auto-render", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_get_has_depth_buffer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-depth-buffer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_set_has_depth_buffer(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-depth-buffer", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_get_has_stencil_buffer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-stencil-buffer", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_set_has_stencil_buffer(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-stencil-buffer", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_get_use_es(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-es", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_g_l_area_set_use_es(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-es", c_value, NULL);
CAMLreturn(Val_unit);
}
