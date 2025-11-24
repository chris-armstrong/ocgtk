/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringObject */

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

/* Type-specific conversion macros for GtkStringObject */
#define GtkStringObject_val(val) ((GtkStringObject*)ext_of_val(val))
#define Val_GtkStringObject(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_string_object_new(value arg1)
{
CAMLparam1(arg1);
GtkStringObject *obj = gtk_string_object_new(String_val(arg1));
CAMLreturn(Val_GtkStringObject(obj));
}

CAMLexport CAMLprim value ml_gtk_string_object_get_string(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStringObject *obj = (GtkStringObject *)GtkStringObject_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "string", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}
