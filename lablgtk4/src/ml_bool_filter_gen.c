/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BoolFilter */

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

/* Type-specific conversion macros for GtkBoolFilter */
#define GtkBoolFilter_val(val) ((GtkBoolFilter*)ext_of_val(val))
#define Val_GtkBoolFilter(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_bool_filter_new(value arg1)
{
CAMLparam1(arg1);
GtkBoolFilter *obj = gtk_bool_filter_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkBoolFilter(obj));
}

CAMLexport CAMLprim value ml_gtk_bool_filter_set_expression(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bool_filter_set_expression(GtkBoolFilter_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bool_filter_get_expression(value self)
{
CAMLparam1(self);

GtkExpression* result = gtk_bool_filter_get_expression(GtkBoolFilter_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_bool_filter_get_invert(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkBoolFilter *obj = (GtkBoolFilter *)GtkBoolFilter_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invert", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_bool_filter_set_invert(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkBoolFilter *obj = (GtkBoolFilter *)GtkBoolFilter_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invert", c_value, NULL);
CAMLreturn(Val_unit);
}
