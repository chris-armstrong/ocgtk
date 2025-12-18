/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PasswordEntry */

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

/* Type-specific conversion macros for GtkPasswordEntry */
#ifndef Val_GtkPasswordEntry
#define GtkPasswordEntry_val(val) ((GtkPasswordEntry*)ext_of_val(val))
#define Val_GtkPasswordEntry(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPasswordEntry */


CAMLexport CAMLprim value ml_gtk_password_entry_new(value unit)
{
CAMLparam1(unit);
GtkPasswordEntry *obj = gtk_password_entry_new();
CAMLreturn(Val_GtkPasswordEntry(obj));
}

CAMLexport CAMLprim value ml_gtk_password_entry_set_show_peek_icon(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_password_entry_set_show_peek_icon(GtkPasswordEntry_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_password_entry_get_show_peek_icon(value self)
{
CAMLparam1(self);

gboolean result = gtk_password_entry_get_show_peek_icon(GtkPasswordEntry_val(self));
CAMLreturn(Val_bool(result));
}
