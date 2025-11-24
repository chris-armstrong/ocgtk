/* GENERATED CODE - DO NOT EDIT */
/* C bindings for WindowControls */

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

/* Type-specific conversion macros for GtkWindowControls */
#define GtkWindowControls_val(val) ((GtkWindowControls*)ext_of_val(val))
#define Val_GtkWindowControls(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_window_controls_new(value arg1)
{
CAMLparam1(arg1);
GtkWindowControls *obj = gtk_window_controls_new(GtkPackType_val(arg1));
CAMLreturn(Val_GtkWindowControls(obj));
}

CAMLexport CAMLprim value ml_gtk_window_controls_set_side(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_controls_set_side(GtkWindowControls_val(self), GtkPackType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_controls_get_side(value self)
{
CAMLparam1(self);

GtkPackType result = gtk_window_controls_get_side(GtkWindowControls_val(self));
CAMLreturn(Val_GtkPackType(result));
}

CAMLexport CAMLprim value ml_gtk_window_controls_get_decoration_layout(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindowControls *obj = (GtkWindowControls *)GtkWindowControls_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "decoration-layout", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_window_controls_set_decoration_layout(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWindowControls *obj = (GtkWindowControls *)GtkWindowControls_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "decoration-layout", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_controls_get_empty(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWindowControls *obj = (GtkWindowControls *)GtkWindowControls_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "empty", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}
