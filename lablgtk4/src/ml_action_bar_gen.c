/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ActionBar */

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

/* Type-specific conversion macros for GtkActionBar */
#define GtkActionBar_val(val) ((GtkActionBar*)ext_of_val(val))
#define Val_GtkActionBar(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_action_bar_new(value unit)
{
CAMLparam1(unit);
GtkActionBar *obj = gtk_action_bar_new();
CAMLreturn(Val_GtkActionBar(obj));
}

CAMLexport CAMLprim value ml_gtk_action_bar_set_center_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_action_bar_set_center_widget(GtkActionBar_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_remove(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_action_bar_remove(GtkActionBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_pack_start(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_action_bar_pack_start(GtkActionBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_pack_end(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_action_bar_pack_end(GtkActionBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_action_bar_get_center_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_action_bar_get_center_widget(GtkActionBar_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_action_bar_get_revealed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkActionBar *obj = (GtkActionBar *)GtkActionBar_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "revealed", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_action_bar_set_revealed(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkActionBar *obj = (GtkActionBar *)GtkActionBar_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "revealed", c_value, NULL);
CAMLreturn(Val_unit);
}
