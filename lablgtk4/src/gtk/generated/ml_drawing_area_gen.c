/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DrawingArea */

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

/* Type-specific conversion macros for GtkDrawingArea */
#ifndef Val_GtkDrawingArea
#define GtkDrawingArea_val(val) ((GtkDrawingArea*)ext_of_val(val))
#define Val_GtkDrawingArea(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDrawingArea */


CAMLexport CAMLprim value ml_gtk_drawing_area_new(value unit)
{
CAMLparam1(unit);
GtkDrawingArea *obj = gtk_drawing_area_new();
CAMLreturn(Val_GtkDrawingArea(obj));
}

CAMLexport CAMLprim value ml_gtk_drawing_area_get_content_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "content-height");
if (pspec == NULL) caml_failwith("ml_gtk_drawing_area_get_content_height: property 'content-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "content-height", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_set_content_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "content-height");
if (pspec == NULL) caml_failwith("ml_gtk_drawing_area_set_content_height: property 'content-height' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "content-height", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_get_content_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "content-width");
if (pspec == NULL) caml_failwith("ml_gtk_drawing_area_get_content_width: property 'content-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "content-width", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_set_content_width(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "content-width");
if (pspec == NULL) caml_failwith("ml_gtk_drawing_area_set_content_width: property 'content-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "content-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
