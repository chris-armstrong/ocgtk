/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Root */

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


CAMLexport CAMLprim value ml_gtk_root_set_focus(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_root_set_focus(GtkRoot_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_root_get_focus(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_root_get_focus(GtkRoot_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}
