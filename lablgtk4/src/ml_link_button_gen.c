/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LinkButton */

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

/* Type-specific conversion macros for GtkLinkButton */
#define GtkLinkButton_val(val) ((GtkLinkButton*)ext_of_val(val))
#define Val_GtkLinkButton(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_link_button_new(value arg1)
{
CAMLparam1(arg1);
GtkLinkButton *obj = gtk_link_button_new(String_val(arg1));
CAMLreturn(Val_GtkLinkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_link_button_new_with_label(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkLinkButton *obj = gtk_link_button_new_with_label(String_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkLinkButton(obj));
}

CAMLexport CAMLprim value ml_gtk_link_button_get_uri(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "uri", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_link_button_set_uri(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "uri", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_link_button_get_visited(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visited", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_link_button_set_visited(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLinkButton *obj = (GtkLinkButton *)GtkLinkButton_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visited", c_value, NULL);
CAMLreturn(Val_unit);
}
