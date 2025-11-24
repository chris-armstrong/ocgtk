/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureSingle */

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

/* Type-specific conversion macros for GtkGestureSingle */
#define GtkGestureSingle_val(val) ((GtkGestureSingle*)ext_of_val(val))
#define Val_GtkGestureSingle(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_gesture_single_get_current_button(value self)
{
CAMLparam1(self);

guint result = gtk_gesture_single_get_current_button(GtkGestureSingle_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_button(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "button", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_button(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "button", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_exclusive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "exclusive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_exclusive(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "exclusive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_get_touch_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "touch-only", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_single_set_touch_only(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGestureSingle *obj = (GtkGestureSingle *)GtkGestureSingle_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "touch-only", c_value, NULL);
CAMLreturn(Val_unit);
}
