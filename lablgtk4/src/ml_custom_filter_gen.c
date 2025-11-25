/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CustomFilter */

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

/* Type-specific conversion macros for GtkCustomFilter */
#ifndef Val_GtkCustomFilter
#define GtkCustomFilter_val(val) ((GtkCustomFilter*)ext_of_val(val))
#define Val_GtkCustomFilter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCustomFilter */


CAMLexport CAMLprim value ml_gtk_custom_filter_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkCustomFilter *obj = gtk_custom_filter_new(arg1, arg2, arg3);
CAMLreturn(Val_GtkCustomFilter(obj));
}
