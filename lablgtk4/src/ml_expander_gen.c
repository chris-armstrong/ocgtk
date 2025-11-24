/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Expander */

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

/* Type-specific conversion macros for GtkExpander */
#define GtkExpander_val(val) ((GtkExpander*)ext_of_val(val))
#define Val_GtkExpander(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_expander_new(value arg1)
{
CAMLparam1(arg1);
GtkExpander *obj = gtk_expander_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkExpander(obj));
}

CAMLexport CAMLprim value ml_gtk_expander_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkExpander *obj = gtk_expander_new_with_mnemonic((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkExpander(obj));
}

CAMLexport CAMLprim value ml_gtk_expander_set_label_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_expander_set_label_widget(GtkExpander_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_expander_set_child(GtkExpander_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_label_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_expander_get_label_widget(GtkExpander_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_expander_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_expander_get_child(GtkExpander_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_expander_get_expanded(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "expanded", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_expanded(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "expanded", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_resize_toplevel(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "resize-toplevel", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_resize_toplevel(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "resize-toplevel", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_use_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-markup", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_use_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_expander_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_expander_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkExpander *obj = (GtkExpander *)GtkExpander_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}
