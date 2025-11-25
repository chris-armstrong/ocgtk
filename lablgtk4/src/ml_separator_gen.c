/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Separator */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSeparator */
#ifndef Val_GtkSeparator
#define GtkSeparator_val(val) ((GtkSeparator*)ext_of_val(val))
#define Val_GtkSeparator(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSeparator */


CAMLexport CAMLprim value ml_gtk_separator_new(value arg1)
{
CAMLparam1(arg1);
GtkSeparator *obj = gtk_separator_new(GtkOrientation_val(arg1));
CAMLreturn(Val_GtkSeparator(obj));
}
