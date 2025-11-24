/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorDialog */

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

/* Type-specific conversion macros for GtkColorDialog */
#define GtkColorDialog_val(val) ((GtkColorDialog*)ext_of_val(val))
#define Val_GtkColorDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_color_dialog_new(value unit)
{
CAMLparam1(unit);
GtkColorDialog *obj = gtk_color_dialog_new();
CAMLreturn(Val_GtkColorDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_color_dialog_get_modal(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColorDialog *obj = (GtkColorDialog *)GtkColorDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "modal", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_set_modal(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColorDialog *obj = (GtkColorDialog *)GtkColorDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "modal", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColorDialog *obj = (GtkColorDialog *)GtkColorDialog_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColorDialog *obj = (GtkColorDialog *)GtkColorDialog_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_get_with_alpha(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColorDialog *obj = (GtkColorDialog *)GtkColorDialog_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "with-alpha", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_dialog_set_with_alpha(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColorDialog *obj = (GtkColorDialog *)GtkColorDialog_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "with-alpha", c_value, NULL);
CAMLreturn(Val_unit);
}
