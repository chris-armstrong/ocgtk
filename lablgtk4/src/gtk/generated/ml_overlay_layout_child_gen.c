/* GENERATED CODE - DO NOT EDIT */
/* C bindings for OverlayLayoutChild */

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

/* Type-specific conversion macros for GtkOverlayLayoutChild */
#ifndef Val_GtkOverlayLayoutChild
#define GtkOverlayLayoutChild_val(val) ((GtkOverlayLayoutChild*)ext_of_val(val))
#define Val_GtkOverlayLayoutChild(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkOverlayLayoutChild */


CAMLexport CAMLprim value ml_gtk_overlay_layout_child_set_measure(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_overlay_layout_child_set_measure(GtkOverlayLayoutChild_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_overlay_layout_child_set_clip_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_overlay_layout_child_set_clip_overlay(GtkOverlayLayoutChild_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_overlay_layout_child_get_measure(value self)
{
CAMLparam1(self);

gboolean result = gtk_overlay_layout_child_get_measure(GtkOverlayLayoutChild_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_overlay_layout_child_get_clip_overlay(value self)
{
CAMLparam1(self);

gboolean result = gtk_overlay_layout_child_get_clip_overlay(GtkOverlayLayoutChild_val(self));
CAMLreturn(Val_bool(result));
}
