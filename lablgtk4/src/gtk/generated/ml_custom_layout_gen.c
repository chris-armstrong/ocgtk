/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CustomLayout */

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

/* Type-specific conversion macros for GtkCustomLayout */
#ifndef Val_GtkCustomLayout
#define GtkCustomLayout_val(val) ((GtkCustomLayout*)ext_of_val(val))
#define Val_GtkCustomLayout(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCustomLayout */


CAMLexport CAMLprim value ml_gtk_custom_layout_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkCustomLayout *obj = gtk_custom_layout_new(arg1, arg2, arg3);
CAMLreturn(Val_GtkCustomLayout(obj));
}
