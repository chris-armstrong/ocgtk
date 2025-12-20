/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererPixbuf */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkCellRendererPixbuf */
#ifndef Val_GtkCellRendererPixbuf
#define GtkCellRendererPixbuf_val(val) ((GtkCellRendererPixbuf*)ext_of_val(val))
#define Val_GtkCellRendererPixbuf(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererPixbuf */


CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererPixbuf *obj = gtk_cell_renderer_pixbuf_new();
CAMLreturn(Val_GtkCellRendererPixbuf(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererPixbuf *obj = (GtkCellRendererPixbuf *)GtkCellRendererPixbuf_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_pixbuf_get_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererPixbuf *obj = (GtkCellRendererPixbuf *)GtkCellRendererPixbuf_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_pixbuf_set_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_get_icon_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererPixbuf *obj = (GtkCellRendererPixbuf *)GtkCellRendererPixbuf_val(self);
    GtkIconSize prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-size");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_pixbuf_get_icon_size: property 'icon-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "icon-size", &prop_gvalue);
    prop_value = (GtkIconSize)g_value_get_enum(&prop_gvalue);

result = Val_GtkIconSize(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_set_icon_size(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererPixbuf *obj = (GtkCellRendererPixbuf *)GtkCellRendererPixbuf_val(self);
    GtkIconSize c_value = GtkIconSize_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-size");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_pixbuf_set_icon_size: property 'icon-size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_enum(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "icon-size", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
