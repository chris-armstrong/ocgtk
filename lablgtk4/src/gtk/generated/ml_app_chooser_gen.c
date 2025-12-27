/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooser */

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

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_app_chooser_refresh(value self)
{
CAMLparam1(self);

gtk_app_chooser_refresh(GtkAppChooser_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_get_content_type(value self)
{
CAMLparam1(self);

char* result = gtk_app_chooser_get_content_type(GtkAppChooser_val(self));
CAMLreturn(caml_copy_string(result));
}
