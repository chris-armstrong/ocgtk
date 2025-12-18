/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FixedLayout */

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

/* Type-specific conversion macros for GtkFixedLayout */
#ifndef Val_GtkFixedLayout
#define GtkFixedLayout_val(val) ((GtkFixedLayout*)ext_of_val(val))
#define Val_GtkFixedLayout(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFixedLayout */


CAMLexport CAMLprim value ml_gtk_fixed_layout_new(value unit)
{
CAMLparam1(unit);
GtkFixedLayout *obj = gtk_fixed_layout_new();
CAMLreturn(Val_GtkFixedLayout(obj));
}
