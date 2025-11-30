/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Filter */

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

/* Type-specific conversion macros for GtkFilter */
#ifndef Val_GtkFilter
#define GtkFilter_val(val) ((GtkFilter*)ext_of_val(val))
#define Val_GtkFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFilter */


CAMLexport CAMLprim value ml_gtk_filter_get_strictness(value self)
{
CAMLparam1(self);

GtkFilterMatch result = gtk_filter_get_strictness(GtkFilter_val(self));
CAMLreturn(Val_GtkFilterMatch(result));
}

CAMLexport CAMLprim value ml_gtk_filter_changed(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_filter_changed(GtkFilter_val(self), GtkFilterChange_val(arg1));
CAMLreturn(Val_unit);
}
