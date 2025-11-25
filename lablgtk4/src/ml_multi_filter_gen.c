/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MultiFilter */

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

/* Type-specific conversion macros for GtkMultiFilter */
#ifndef Val_GtkMultiFilter
#define GtkMultiFilter_val(val) ((GtkMultiFilter*)ext_of_val(val))
#define Val_GtkMultiFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMultiFilter */


CAMLexport CAMLprim value ml_gtk_multi_filter_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_multi_filter_remove(GtkMultiFilter_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_multi_filter_append(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_multi_filter_append(GtkMultiFilter_val(self), GtkFilter_val(arg1));
CAMLreturn(Val_unit);
}
