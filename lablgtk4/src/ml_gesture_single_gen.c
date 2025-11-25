/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureSingle */

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

/* Type-specific conversion macros for GtkGestureSingle */
#ifndef Val_GtkGestureSingle
#define GtkGestureSingle_val(val) ((GtkGestureSingle*)ext_of_val(val))
#define Val_GtkGestureSingle(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGestureSingle */


CAMLexport CAMLprim value ml_gtk_gesture_single_set_touch_only(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gesture_single_set_touch_only(GtkGestureSingle_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_exclusive(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gesture_single_set_exclusive(GtkGestureSingle_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_button(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_gesture_single_set_button(GtkGestureSingle_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_touch_only(value self)
{
CAMLparam1(self);

gboolean result = gtk_gesture_single_get_touch_only(GtkGestureSingle_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_exclusive(value self)
{
CAMLparam1(self);

gboolean result = gtk_gesture_single_get_exclusive(GtkGestureSingle_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_current_button(value self)
{
CAMLparam1(self);

guint result = gtk_gesture_single_get_current_button(GtkGestureSingle_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_button(value self)
{
CAMLparam1(self);

guint result = gtk_gesture_single_get_button(GtkGestureSingle_val(self));
CAMLreturn(Val_int(result));
}
