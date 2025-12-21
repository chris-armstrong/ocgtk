/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CustomSorter */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkCustomSorter */
#ifndef Val_GtkCustomSorter
#define GtkCustomSorter_val(val) ((GtkCustomSorter*)ext_of_val(val))
#define Val_GtkCustomSorter(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCustomSorter */


CAMLexport CAMLprim value ml_gtk_custom_sorter_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkCustomSorter *obj = gtk_custom_sorter_new(arg1, arg2, arg3);
CAMLreturn(Val_GtkCustomSorter(obj));
}
