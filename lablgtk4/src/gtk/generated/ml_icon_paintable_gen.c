/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconPaintable */

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

/* Type-specific conversion macros for GtkIconPaintable */
#ifndef Val_GtkIconPaintable
#define GtkIconPaintable_val(val) ((GtkIconPaintable*)ext_of_val(val))
#define Val_GtkIconPaintable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkIconPaintable */


CAMLexport CAMLprim value ml_gtk_icon_paintable_new_for_file(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkIconPaintable *obj = gtk_icon_paintable_new_for_file(arg1, Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_GtkIconPaintable(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_paintable_is_symbolic(value self)
{
CAMLparam1(self);

gboolean result = gtk_icon_paintable_is_symbolic(GtkIconPaintable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_paintable_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconPaintable *obj = (GtkIconPaintable *)GtkIconPaintable_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "icon-name");
if (pspec == NULL) caml_failwith("ml_gtk_icon_paintable_get_icon_name: property 'icon-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "icon-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_paintable_get_is_symbolic(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconPaintable *obj = (GtkIconPaintable *)GtkIconPaintable_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "is-symbolic");
if (pspec == NULL) caml_failwith("ml_gtk_icon_paintable_get_is_symbolic: property 'is-symbolic' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "is-symbolic", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
