/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Revealer */

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

/* Type-specific conversion macros for GtkRevealer */
#define GtkRevealer_val(val) ((GtkRevealer*)ext_of_val(val))
#define Val_GtkRevealer(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_revealer_new(value unit)
{
CAMLparam1(unit);
GtkRevealer *obj = gtk_revealer_new();
CAMLreturn(Val_GtkRevealer(obj));
}

CAMLexport CAMLprim value ml_gtk_revealer_set_transition_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_revealer_set_transition_type(GtkRevealer_val(self), GtkRevealerTransitionType_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_revealer_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_revealer_set_child(GtkRevealer_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_revealer_get_transition_type(value self)
{
CAMLparam1(self);


    GtkRevealerTransitionType result = gtk_revealer_get_transition_type(GtkRevealer_val(self));
CAMLreturn(Val_GtkRevealerTransitionType(result));
}

CAMLexport CAMLprim value ml_gtk_revealer_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_revealer_get_child(GtkRevealer_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_revealer_get_child_revealed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "child-revealed", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_revealer_get_reveal_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "reveal-child", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_revealer_set_reveal_child(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "reveal-child", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_revealer_get_transition_duration(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "transition-duration", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_revealer_set_transition_duration(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkRevealer *obj = (GtkRevealer *)GtkRevealer_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "transition-duration", c_value, NULL);
CAMLreturn(Val_unit);
}
