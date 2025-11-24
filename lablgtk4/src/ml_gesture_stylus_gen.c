/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GestureStylus */

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

/* Type-specific conversion macros for GtkGestureStylus */
#define GtkGestureStylus_val(val) ((GtkGestureStylus*)ext_of_val(val))
#define Val_GtkGestureStylus(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_gesture_stylus_new(value unit)
{
CAMLparam1(unit);
GtkGestureStylus *obj = gtk_gesture_stylus_new();
CAMLreturn(Val_GtkGestureStylus(obj));
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_get_stylus_only(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGestureStylus *obj = (GtkGestureStylus *)GtkGestureStylus_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "stylus-only", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_gesture_stylus_set_stylus_only(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGestureStylus *obj = (GtkGestureStylus *)GtkGestureStylus_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "stylus-only", c_value, NULL);
CAMLreturn(Val_unit);
}
