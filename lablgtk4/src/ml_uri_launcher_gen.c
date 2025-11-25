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
#ifndef Val_GtkUriLauncher
#define GtkUriLauncher_val(val) ((GtkUriLauncher*)ext_of_val(val))
#define Val_GtkUriLauncher(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkUriLauncher */


CAMLexport CAMLprim value ml_gtk_uri_launcher_new(value arg1)
{
CAMLparam1(arg1);
GtkUriLauncher *obj = gtk_uri_launcher_new(String_option_val(arg1));
CAMLreturn(Val_GtkUriLauncher(obj));
}

CAMLexport CAMLprim value ml_gtk_uri_launcher_set_uri(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_uri_launcher_set_uri(GtkUriLauncher_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_uri_launcher_get_uri(value self)
{
CAMLparam1(self);

const char* result = gtk_uri_launcher_get_uri(GtkUriLauncher_val(self));
CAMLreturn(Val_option_string(result));
}
