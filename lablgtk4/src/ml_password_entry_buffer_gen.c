/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PasswordEntryBuffer */

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

/* Type-specific conversion macros for GtkPasswordEntryBuffer */
#ifndef Val_GtkPasswordEntryBuffer
#define GtkPasswordEntryBuffer_val(val) ((GtkPasswordEntryBuffer*)ext_of_val(val))
#define Val_GtkPasswordEntryBuffer(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPasswordEntryBuffer */


CAMLexport CAMLprim value ml_gtk_password_entry_buffer_new(value unit)
{
CAMLparam1(unit);
GtkPasswordEntryBuffer *obj = gtk_password_entry_buffer_new();
CAMLreturn(Val_GtkPasswordEntryBuffer(obj));
}
