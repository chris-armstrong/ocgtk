/* GENERATED CODE - DO NOT EDIT */
/* C bindings for OverlayLayout */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkOverlayLayout */
#ifndef Val_GtkOverlayLayout
#define GtkOverlayLayout_val(val) ((GtkOverlayLayout*)ext_of_val(val))
#define Val_GtkOverlayLayout(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkOverlayLayout */


CAMLexport CAMLprim value ml_gtk_overlay_layout_new(value unit)
{
CAMLparam1(unit);
GtkOverlayLayout *obj = gtk_overlay_layout_new();
CAMLreturn(Val_GtkOverlayLayout(obj));
}
