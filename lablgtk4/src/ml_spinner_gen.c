/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Spinner */

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

/* Type-specific conversion macros for GtkSpinner */
#define GtkSpinner_val(val) ((GtkSpinner*)ext_of_val(val))
#define Val_GtkSpinner(obj) ((value)(val_of_ext(obj)))


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
g_object_get(G_OBJECT(obj), "spinning", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_spinner_set_spinning(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSpinner *obj = (GtkSpinner *)GtkSpinner_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "spinning", c_value, NULL);
CAMLreturn(Val_unit);
}
