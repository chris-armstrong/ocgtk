/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringSorter */

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

/* Type-specific conversion macros for GtkStringSorter */
#ifndef Val_GtkStringSorter
#define GtkStringSorter_val(val) ((GtkStringSorter*)ext_of_val(val))
#define Val_GtkStringSorter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkStringSorter */


CAMLexport CAMLprim value ml_gtk_string_sorter_new(value arg1)
{
CAMLparam1(arg1);
GtkStringSorter *obj = gtk_string_sorter_new(Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_GtkStringSorter(obj));
}

CAMLexport CAMLprim value ml_gtk_string_sorter_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_sorter_set_expression(GtkStringSorter_val(self), Option_val(arg1, GtkExpression_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_sorter_set_collation(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_sorter_set_collation(GtkStringSorter_val(self), GtkCollation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_sorter_get_expression(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_string_sorter_get_expression(GtkStringSorter_val(self));
CAMLreturn(Val_option(result, Val_GtkExpression));
}

CAMLexport CAMLprim value ml_gtk_string_sorter_get_collation(value self)
{
CAMLparam1(self);

GtkCollation result = gtk_string_sorter_get_collation(GtkStringSorter_val(self));
CAMLreturn(Val_GtkCollation(result));
}

CAMLexport CAMLprim value ml_gtk_string_sorter_get_ignore_case(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStringSorter *obj = (GtkStringSorter *)GtkStringSorter_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ignore-case");
if (pspec == NULL) caml_failwith("ml_gtk_string_sorter_get_ignore_case: property 'ignore-case' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "ignore-case", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_string_sorter_set_ignore_case(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkStringSorter *obj = (GtkStringSorter *)GtkStringSorter_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ignore-case");
if (pspec == NULL) caml_failwith("ml_gtk_string_sorter_set_ignore_case: property 'ignore-case' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "ignore-case", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
