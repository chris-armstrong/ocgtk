/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UriLauncher */

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

/* Type-specific conversion macros for GtkUriLauncher */
#define GtkUriLauncher_val(val) ((GtkUriLauncher*)ext_of_val(val))
#define Val_GtkUriLauncher(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_uri_launcher_new(value arg1)
{
CAMLparam1(arg1);
GtkUriLauncher *obj = gtk_uri_launcher_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkUriLauncher(obj));
}

CAMLexport CAMLprim value ml_gtk_uri_launcher_get_uri(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkUriLauncher *obj = (GtkUriLauncher *)GtkUriLauncher_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "uri", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_uri_launcher_set_uri(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkUriLauncher *obj = (GtkUriLauncher *)GtkUriLauncher_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "uri", c_value, NULL);
CAMLreturn(Val_unit);
}
