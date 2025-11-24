/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Text */

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

/* Type-specific conversion macros for GtkText */
#define GtkText_val(val) ((GtkText*)ext_of_val(val))
#define Val_GtkText(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_text_new(value unit)
{
CAMLparam1(unit);
GtkText *obj = gtk_text_new();
CAMLreturn(Val_GtkText(obj));
}

CAMLexport CAMLprim value ml_gtk_text_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkText *obj = gtk_text_new_with_buffer(GtkWidget_val(arg1));
CAMLreturn(Val_GtkText(obj));
}

CAMLexport CAMLprim value ml_gtk_text_unset_invisible_char(value self)
{
CAMLparam1(self);


    gtk_text_unset_invisible_char(GtkText_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_set_input_purpose(GtkText_val(self), GtkInputPurpose_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_set_input_hints(GtkText_val(self), GtkInputHints_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_set_buffer(GtkText_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_grab_focus_without_selecting(value self)
{
CAMLparam1(self);


    gboolean result = gtk_text_grab_focus_without_selecting(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_input_purpose(value self)
{
CAMLparam1(self);


    GtkInputPurpose result = gtk_text_get_input_purpose(GtkText_val(self));
CAMLreturn(Val_GtkInputPurpose(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_input_hints(value self)
{
CAMLparam1(self);


    GtkInputHints result = gtk_text_get_input_hints(GtkText_val(self));
CAMLreturn(Val_GtkInputHints(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_buffer(value self)
{
CAMLparam1(self);


    GtkEntryBuffer* result = gtk_text_get_buffer(GtkText_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_activates_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_enable_emoji_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-emoji-completion", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_enable_emoji_completion(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-emoji-completion", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_im_module(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "im-module", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_im_module(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "im-module", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_invisible_char(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "invisible-char", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_invisible_char(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_invisible_char_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible-char-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_invisible_char_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_max_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_max_length(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-length", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_overwrite_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overwrite-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_overwrite_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overwrite-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "placeholder-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_placeholder_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_propagate_text_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "propagate-text-width", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_propagate_text_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "propagate-text-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_scroll_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "scroll-offset", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_get_truncate_multiline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "truncate-multiline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_truncate_multiline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "truncate-multiline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_visibility(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visibility", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_visibility(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visibility", c_value, NULL);
CAMLreturn(Val_unit);
}
