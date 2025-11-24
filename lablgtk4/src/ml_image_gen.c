/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Image */

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

/* Type-specific conversion macros for GtkImage */
#define GtkImage_val(val) ((GtkImage*)ext_of_val(val))
#define Val_GtkImage(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_image_new(value unit)
{
CAMLparam1(unit);
GtkImage *obj = gtk_image_new();
CAMLreturn(Val_GtkImage(obj));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_file(value arg1)
{
CAMLparam1(arg1);
GtkImage *obj = gtk_image_new_from_file(String_val(arg1));
CAMLreturn(Val_GtkImage(obj));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_gicon(value arg1)
{
CAMLparam1(arg1);
GtkImage *obj = gtk_image_new_from_gicon(arg1);
CAMLreturn(Val_GtkImage(obj));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_icon_name(value arg1)
{
CAMLparam1(arg1);
GtkImage *obj = gtk_image_new_from_icon_name((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkImage(obj));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_paintable(value arg1)
{
CAMLparam1(arg1);
GtkImage *obj = gtk_image_new_from_paintable(arg1);
CAMLreturn(Val_GtkImage(obj));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_pixbuf(value arg1)
{
CAMLparam1(arg1);
GtkImage *obj = gtk_image_new_from_pixbuf(arg1);
CAMLreturn(Val_GtkImage(obj));
}

CAMLexport CAMLprim value ml_gtk_image_new_from_resource(value arg1)
{
CAMLparam1(arg1);
GtkImage *obj = gtk_image_new_from_resource(String_val(arg1));
CAMLreturn(Val_GtkImage(obj));
}

CAMLexport CAMLprim value ml_gtk_image_set_icon_size(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_icon_size(GtkImage_val(self), GtkIconSize_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_resource(GtkImage_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_icon_name(GtkImage_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_set_from_file(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_image_set_from_file(GtkImage_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_storage_type(value self)
{
CAMLparam1(self);


    GtkImageType result = gtk_image_get_storage_type(GtkImage_val(self));
CAMLreturn(Val_GtkImageType(result));
}

CAMLexport CAMLprim value ml_gtk_image_get_icon_size(value self)
{
CAMLparam1(self);


    GtkIconSize result = gtk_image_get_icon_size(GtkImage_val(self));
CAMLreturn(Val_GtkIconSize(result));
}

CAMLexport CAMLprim value ml_gtk_image_clear(value self)
{
CAMLparam1(self);


    gtk_image_clear(GtkImage_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_file(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "file", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_file(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "file", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_pixel_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixel-size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_pixel_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixel-size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_resource(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "resource", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_resource(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "resource", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_image_get_use_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-fallback", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_image_set_use_fallback(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkImage *obj = (GtkImage *)GtkImage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-fallback", c_value, NULL);
CAMLreturn(Val_unit);
}
