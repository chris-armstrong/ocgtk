/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BitsetIter */

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

/* Type-specific conversion macros for GtkBitsetIter */
#ifndef Val_GtkBitsetIter
#define GtkBitsetIter_val(val) ((GtkBitsetIter*)ext_of_val(val))
#define Val_GtkBitsetIter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBitsetIter */


CAMLexport CAMLprim value ml_gtk_bitset_iter_is_valid(value self)
{
CAMLparam1(self);

gboolean result = gtk_bitset_iter_is_valid(GtkBitsetIter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_iter_get_value(value self)
{
CAMLparam1(self);

guint result = gtk_bitset_iter_get_value(GtkBitsetIter_val(self));
CAMLreturn(Val_int(result));
}
