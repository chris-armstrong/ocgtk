/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BinLayout */

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

/* Type-specific conversion macros for GtkBinLayout */
#ifndef Val_GtkBinLayout
#define GtkBinLayout_val(val) ((GtkBinLayout*)ext_of_val(val))
#define Val_GtkBinLayout(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBinLayout */


CAMLexport CAMLprim value ml_gtk_bin_layout_new(value unit)
{
CAMLparam1(unit);
GtkBinLayout *obj = gtk_bin_layout_new();
CAMLreturn(Val_GtkBinLayout(obj));
}
