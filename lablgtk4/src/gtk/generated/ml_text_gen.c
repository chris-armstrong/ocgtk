/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Text */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkText */
#ifndef Val_GtkText
#define GtkText_val(val) ((GtkText*)ext_of_val(val))
#define Val_GtkText(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkText */


CAMLexport CAMLprim value ml_gtk_text_new(value unit)
{
CAMLparam1(unit);
GtkText *obj = gtk_text_new();
CAMLreturn(Val_GtkText(obj));
}

CAMLexport CAMLprim value ml_gtk_text_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkText *obj = gtk_text_new_with_buffer(GtkEntryBuffer_val(arg1));
CAMLreturn(Val_GtkText(obj));
}

CAMLexport CAMLprim value ml_gtk_text_unset_invisible_char(value self)
{
CAMLparam1(self);

gtk_text_unset_invisible_char(GtkText_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_visibility(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_visibility(GtkText_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_truncate_multiline(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_truncate_multiline(GtkText_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_propagate_text_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_propagate_text_width(GtkText_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_placeholder_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_placeholder_text(GtkText_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_overwrite_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_overwrite_mode(GtkText_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_max_length(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_max_length(GtkText_val(self), Int_val(arg1));
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

CAMLexport CAMLprim value ml_gtk_text_set_enable_emoji_completion(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_enable_emoji_completion(GtkText_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_buffer(GtkText_val(self), GtkEntryBuffer_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_set_activates_default(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_set_activates_default(GtkText_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_grab_focus_without_selecting(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_grab_focus_without_selecting(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_visibility(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_get_visibility(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_truncate_multiline(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_get_truncate_multiline(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_propagate_text_width(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_get_propagate_text_width(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_placeholder_text(value self)
{
CAMLparam1(self);

const char* result = gtk_text_get_placeholder_text(GtkText_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_overwrite_mode(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_get_overwrite_mode(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_max_length(value self)
{
CAMLparam1(self);

int result = gtk_text_get_max_length(GtkText_val(self));
CAMLreturn(Val_int(result));
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

CAMLexport CAMLprim value ml_gtk_text_get_enable_emoji_completion(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_get_enable_emoji_completion(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_buffer(value self)
{
CAMLparam1(self);

GtkEntryBuffer* result = gtk_text_get_buffer(GtkText_val(self));
CAMLreturn(Val_GtkEntryBuffer(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_activates_default(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_get_activates_default(GtkText_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_get_im_module(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "im-module");
if (pspec == NULL) caml_failwith("ml_gtk_text_get_im_module: property 'im-module' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "im-module", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_im_module(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "im-module");
if (pspec == NULL) caml_failwith("ml_gtk_text_set_im_module: property 'im-module' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "im-module", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_invisible_char_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "invisible-char-set");
if (pspec == NULL) caml_failwith("ml_gtk_text_get_invisible_char_set: property 'invisible-char-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "invisible-char-set", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_set_invisible_char_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkText *obj = (GtkText *)GtkText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "invisible-char-set");
if (pspec == NULL) caml_failwith("ml_gtk_text_set_invisible_char_set: property 'invisible-char-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "invisible-char-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_get_scroll_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkText *obj = (GtkText *)GtkText_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "scroll-offset");
if (pspec == NULL) caml_failwith("ml_gtk_text_get_scroll_offset: property 'scroll-offset' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "scroll-offset", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
