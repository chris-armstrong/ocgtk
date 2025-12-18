/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Picture */

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

/* Type-specific conversion macros for GtkPicture */
#ifndef Val_GtkPicture
#define GtkPicture_val(val) ((GtkPicture*)ext_of_val(val))
#define Val_GtkPicture(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPicture */


CAMLexport CAMLprim value ml_gtk_picture_new(value unit)
{
CAMLparam1(unit);
GtkPicture *obj = gtk_picture_new();
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_file(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_file(arg1);
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_filename(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_filename(String_option_val(arg1));
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_paintable(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_paintable(arg1);
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_pixbuf(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_pixbuf(arg1);
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_resource(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_resource(String_option_val(arg1));
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_set_resource(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_picture_set_resource(GtkPicture_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_set_filename(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_picture_set_filename(GtkPicture_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_set_content_fit(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_picture_set_content_fit(GtkPicture_val(self), GtkContentFit_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_get_content_fit(value self)
{
CAMLparam1(self);

GtkContentFit result = gtk_picture_get_content_fit(GtkPicture_val(self));
CAMLreturn(Val_GtkContentFit(result));
}

CAMLexport CAMLprim value ml_gtk_picture_get_alternative_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "alternative-text");
if (pspec == NULL) caml_failwith("ml_gtk_picture_get_alternative_text: property 'alternative-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "alternative-text", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_picture_set_alternative_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "alternative-text");
if (pspec == NULL) caml_failwith("ml_gtk_picture_set_alternative_text: property 'alternative-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "alternative-text", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-shrink");
if (pspec == NULL) caml_failwith("ml_gtk_picture_get_can_shrink: property 'can-shrink' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "can-shrink", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_picture_set_can_shrink(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "can-shrink");
if (pspec == NULL) caml_failwith("ml_gtk_picture_set_can_shrink: property 'can-shrink' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "can-shrink", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_get_keep_aspect_ratio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "keep-aspect-ratio");
if (pspec == NULL) caml_failwith("ml_gtk_picture_get_keep_aspect_ratio: property 'keep-aspect-ratio' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "keep-aspect-ratio", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_picture_set_keep_aspect_ratio(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "keep-aspect-ratio");
if (pspec == NULL) caml_failwith("ml_gtk_picture_set_keep_aspect_ratio: property 'keep-aspect-ratio' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "keep-aspect-ratio", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
