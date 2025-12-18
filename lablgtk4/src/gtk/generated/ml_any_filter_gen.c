/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AnyFilter */

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

/* Type-specific conversion macros for GtkAnyFilter */
#ifndef Val_GtkAnyFilter
#define GtkAnyFilter_val(val) ((GtkAnyFilter*)ext_of_val(val))
#define Val_GtkAnyFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAnyFilter */


CAMLexport CAMLprim value ml_gtk_any_filter_new(value unit)
{
CAMLparam1(unit);
GtkAnyFilter *obj = gtk_any_filter_new();
CAMLreturn(Val_GtkAnyFilter(obj));
}
