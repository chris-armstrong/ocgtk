/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Spinner */

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

/* Type-specific conversion macros for GtkSpinner */
#ifndef Val_GtkSpinner
#define GtkSpinner_val(val) ((GtkSpinner*)ext_of_val(val))
#define Val_GtkSpinner(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSpinner */


CAMLexport CAMLprim value ml_gtk_spinner_new(value unit)
{
CAMLparam1(unit);
GtkSpinner *obj = gtk_spinner_new();
CAMLreturn(Val_GtkSpinner(obj));
}

CAMLexport CAMLprim value ml_gtk_spinner_stop(value self)
{
CAMLparam1(self);

gtk_spinner_stop(GtkSpinner_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spinner_start(value self)
{
CAMLparam1(self);

gtk_spinner_start(GtkSpinner_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_spinner_get_spinning(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSpinner *obj = (GtkSpinner *)GtkSpinner_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spinning");
if (pspec == NULL) caml_failwith("ml_gtk_spinner_get_spinning: property 'spinning' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "spinning", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spinner_set_spinning(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkSpinner *obj = (GtkSpinner *)GtkSpinner_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "spinning");
if (pspec == NULL) caml_failwith("ml_gtk_spinner_set_spinning: property 'spinning' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "spinning", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
