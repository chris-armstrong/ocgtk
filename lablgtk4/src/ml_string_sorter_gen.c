/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringSorter */

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

/* Type-specific conversion macros for GtkStringSorter */
#define GtkStringSorter_val(val) ((GtkStringSorter*)ext_of_val(val))
#define Val_GtkStringSorter(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_string_sorter_new(value arg1)
{
CAMLparam1(arg1);
GtkStringSorter *obj = gtk_string_sorter_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkStringSorter(obj));
}

CAMLexport CAMLprim value ml_gtk_string_sorter_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_string_sorter_set_expression(GtkStringSorter_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
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
CAMLreturn(Val_GtkWidget(result));
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
g_object_get(G_OBJECT(obj), "ignore-case", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_string_sorter_set_ignore_case(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkStringSorter *obj = (GtkStringSorter *)GtkStringSorter_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "ignore-case", c_value, NULL);
CAMLreturn(Val_unit);
}
