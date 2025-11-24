/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureLongPress */

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

/* Type-specific conversion macros for GtkGestureLongPress */
#define GtkGestureLongPress_val(val) ((GtkGestureLongPress*)ext_of_val(val))
#define Val_GtkGestureLongPress(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_gesture_long_press_new(value unit)
{
CAMLparam1(unit);
GtkGestureLongPress *obj = gtk_gesture_long_press_new();
CAMLreturn(Val_GtkGestureLongPress(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_get_delay_factor(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureLongPress *obj = (GtkGestureLongPress *)GtkGestureLongPress_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "delay-factor", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_long_press_set_delay_factor(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGestureLongPress *obj = (GtkGestureLongPress *)GtkGestureLongPress_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "delay-factor", c_value, NULL);
CAMLreturn(Val_unit);
}
