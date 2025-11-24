/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Label */

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

/* Type-specific conversion macros for GtkLabel */
#define GtkLabel_val(val) ((GtkLabel*)ext_of_val(val))
#define Val_GtkLabel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_label_new(value arg1)
{
CAMLparam1(arg1);
GtkLabel *obj = gtk_label_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkLabel(obj));
}

CAMLexport CAMLprim value ml_gtk_label_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkLabel *obj = gtk_label_new_with_mnemonic((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkLabel(obj));
}

CAMLexport CAMLprim value ml_gtk_label_set_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_wrap_mode(GtkLabel_val(self), PangoWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_text_with_mnemonic(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_text_with_mnemonic(GtkLabel_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_text(GtkLabel_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_natural_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_natural_wrap_mode(GtkLabel_val(self), GtkNaturalWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_mnemonic_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_mnemonic_widget(GtkLabel_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_markup_with_mnemonic(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_markup_with_mnemonic(GtkLabel_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_markup(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_markup(GtkLabel_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_justify(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_justify(GtkLabel_val(self), GtkJustification_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_set_ellipsize(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_label_set_ellipsize(GtkLabel_val(self), PangoEllipsizeMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_select_region(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_label_select_region(GtkLabel_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_wrap_mode(value self)
{
CAMLparam1(self);


    PangoWrapMode result = gtk_label_get_wrap_mode(GtkLabel_val(self));
CAMLreturn(Val_PangoWrapMode(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_text(value self)
{
CAMLparam1(self);


    const char* result = gtk_label_get_text(GtkLabel_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_natural_wrap_mode(value self)
{
CAMLparam1(self);


    GtkNaturalWrapMode result = gtk_label_get_natural_wrap_mode(GtkLabel_val(self));
CAMLreturn(Val_GtkNaturalWrapMode(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_mnemonic_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_label_get_mnemonic_widget(GtkLabel_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_justify(value self)
{
CAMLparam1(self);


    GtkJustification result = gtk_label_get_justify(GtkLabel_val(self));
CAMLreturn(Val_GtkJustification(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_ellipsize(value self)
{
CAMLparam1(self);


    PangoEllipsizeMode result = gtk_label_get_ellipsize(GtkLabel_val(self));
CAMLreturn(Val_PangoEllipsizeMode(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_current_uri(value self)
{
CAMLparam1(self);


    const char* result = gtk_label_get_current_uri(GtkLabel_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_label_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_lines(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_max_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_max_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_mnemonic_keyval(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "mnemonic-keyval", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_get_selectable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "selectable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_selectable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "selectable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_single_line_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "single-line-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_single_line_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "single-line-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_use_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-markup", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_use_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_wrap(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_xalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_label_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "yalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_label_set_yalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkLabel *obj = (GtkLabel *)GtkLabel_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "yalign", c_value, NULL);
CAMLreturn(Val_unit);
}
