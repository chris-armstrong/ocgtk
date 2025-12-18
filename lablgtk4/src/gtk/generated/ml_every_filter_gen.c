/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EveryFilter */

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

/* Type-specific conversion macros for GtkEveryFilter */
#ifndef Val_GtkEveryFilter
#define GtkEveryFilter_val(val) ((GtkEveryFilter*)ext_of_val(val))
#define Val_GtkEveryFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEveryFilter */


CAMLexport CAMLprim value ml_gtk_every_filter_new(value unit)
{
CAMLparam1(unit);
GtkEveryFilter *obj = gtk_every_filter_new();
CAMLreturn(Val_GtkEveryFilter(obj));
}
