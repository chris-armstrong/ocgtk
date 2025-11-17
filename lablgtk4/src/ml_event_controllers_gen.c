/* GENERATED CODE - DO NOT EDIT */
/* Generated from Gtk-4.0.gir for Phase 3 & Phase 5 */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Type conversions - use direct cast (GObjects) */
#define GtkEventController_val(val) ((GtkEventController*)Pointer_val(val))
#define Val_GtkEventController(obj) ((value)(obj))
/* Note: GtkWidget_val and Val_GtkWidget are defined in wrappers.h */


CAMLprim value ml_gtk_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_new_from_icon_name(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_button_new_from_icon_name(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_button_set_label(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_button_set_icon_name(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_button_set_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_label(value self)
{
CAMLparam1(self);
const char* result = gtk_button_get_label(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_button_get_icon_name(value self)
{
CAMLparam1(self);
const char* result = gtk_button_get_icon_name(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_button_get_child(value self)
{
CAMLparam1(self);
GtkWidget* result = gtk_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_button_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-shrink", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_button_set_can_shrink(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "can-shrink", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_button_set_has_frame(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_button_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_check_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_check_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_check_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_check_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_check_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_check_button_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_check_button_set_label(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_check_button_set_group(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_check_button_set_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_label(value self)
{
CAMLparam1(self);
const char* result = gtk_check_button_get_label(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_check_button_get_child(value self)
{
CAMLparam1(self);
GtkWidget* result = gtk_check_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_check_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_check_button_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_inconsistent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inconsistent", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_check_button_set_inconsistent(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inconsistent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_check_button_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_entry_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_entry_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_entry_new_with_buffer(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_entry_unset_invisible_char(value self)
{
CAMLparam1(self);
gtk_entry_unset_invisible_char(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_tabs(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_placeholder_text(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_placeholder_text(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_input_purpose(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_input_hints(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_tooltip_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_tooltip_text(GtkWidget_val(self), arg1, String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_tooltip_markup(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_tooltip_markup(GtkWidget_val(self), arg1, String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_sensitive(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_sensitive(GtkWidget_val(self), arg1, Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_from_paintable(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_from_paintable(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_from_icon_name(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_from_icon_name(GtkWidget_val(self), arg1, String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_from_gicon(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_from_gicon(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_drag_source(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_entry_set_icon_drag_source(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_activatable(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_activatable(GtkWidget_val(self), arg1, Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_completion(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_completion(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_buffer(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_attributes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_alignment(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_alignment(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_reset_im_context(value self)
{
CAMLparam1(self);
gtk_entry_reset_im_context(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_progress_pulse(value self)
{
CAMLparam1(self);
gtk_entry_progress_pulse(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_grab_focus_without_selecting(value self)
{
CAMLparam1(self);
gboolean result = gtk_entry_grab_focus_without_selecting(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_tabs(value self)
{
CAMLparam1(self);
void *result = gtk_entry_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
const char* result = gtk_entry_get_placeholder_text(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_entry_get_input_purpose(value self)
{
CAMLparam1(self);
GtkInputPurpose result = gtk_entry_get_input_purpose(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_entry_get_input_hints(value self)
{
CAMLparam1(self);
GtkInputHints result = gtk_entry_get_input_hints(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_entry_get_icon_tooltip_text(value self, value arg1)
{
CAMLparam2(self, arg1);
void *result = gtk_entry_get_icon_tooltip_text(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_tooltip_markup(value self, value arg1)
{
CAMLparam2(self, arg1);
void *result = gtk_entry_get_icon_tooltip_markup(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_storage_type(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkImageType result = gtk_entry_get_icon_storage_type(GtkWidget_val(self), arg1);
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_entry_get_icon_sensitive(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_entry_get_icon_sensitive(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_icon_paintable(value self, value arg1)
{
CAMLparam2(self, arg1);
void *result = gtk_entry_get_icon_paintable(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);
const char* result = gtk_entry_get_icon_name(GtkWidget_val(self), arg1);
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_entry_get_icon_gicon(value self, value arg1)
{
CAMLparam2(self, arg1);
void *result = gtk_entry_get_icon_gicon(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
void *result = gtk_entry_get_icon_at_pos(GtkWidget_val(self), arg1, arg2);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_area(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_get_icon_area(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_icon_activatable(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_entry_get_icon_activatable(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_extra_menu(value self)
{
CAMLparam1(self);
void *result = gtk_entry_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_current_icon_drag_source(value self)
{
CAMLparam1(self);
void *result = gtk_entry_get_current_icon_drag_source(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_completion(value self)
{
CAMLparam1(self);
void *result = gtk_entry_get_completion(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_buffer(value self)
{
CAMLparam1(self);
void *result = gtk_entry_get_buffer(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_attributes(value self)
{
CAMLparam1(self);
void *result = gtk_entry_get_attributes(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_alignment(value self)
{
CAMLparam1(self);
float result = gtk_entry_get_alignment(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLprim value ml_gtk_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_activates_default(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_enable_emoji_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-emoji-completion", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_enable_emoji_completion(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-emoji-completion", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_has_frame(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_invisible_char(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "invisible-char", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_invisible_char(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_invisible_char_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible-char-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_invisible_char_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_max_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_max_length(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-length", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_overwrite_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overwrite-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_overwrite_mode(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overwrite-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_primary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_primary_icon_activatable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_primary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-sensitive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_primary_icon_sensitive(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-sensitive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_progress_fraction(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "progress-fraction", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_progress_fraction(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "progress-fraction", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_progress_pulse_step(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "progress-pulse-step", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_progress_pulse_step(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "progress-pulse-step", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_scroll_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "scroll-offset", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_secondary_icon_activatable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-sensitive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_secondary_icon_sensitive(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-sensitive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_show_emoji_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-emoji-icon", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_show_emoji_icon(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-emoji-icon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_text_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "text-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_get_truncate_multiline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "truncate-multiline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_truncate_multiline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "truncate-multiline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_visibility(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visibility", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_visibility(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visibility", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_file(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_file(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_gicon(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_gicon(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_icon_name(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_icon_name(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_paintable(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_paintable(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_pixbuf(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_pixbuf(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_resource(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_image_new_from_resource(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_set_icon_size(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_image_set_icon_size(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_image_set_from_resource(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_pixbuf(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_image_set_from_pixbuf(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_paintable(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_image_set_from_paintable(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_image_set_from_icon_name(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_gicon(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_image_set_from_gicon(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_file(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_image_set_from_file(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_storage_type(value self)
{
CAMLparam1(self);
GtkImageType result = gtk_image_get_storage_type(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_image_get_paintable(value self)
{
CAMLparam1(self);
void *result = gtk_image_get_paintable(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_get_icon_size(value self)
{
CAMLparam1(self);
GtkIconSize result = gtk_image_get_icon_size(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_image_get_icon_name(value self)
{
CAMLparam1(self);
const char* result = gtk_image_get_icon_name(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_image_get_gicon(value self)
{
CAMLparam1(self);
void *result = gtk_image_get_gicon(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_clear(value self)
{
CAMLparam1(self);
gtk_image_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_pixel_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixel-size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_pixel_size(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixel-size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_use_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-fallback", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_use_fallback(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-fallback", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_label_new(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_label_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_label_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_label_set_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_wrap_mode(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_text_with_mnemonic(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_text_with_mnemonic(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_text(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_tabs(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_natural_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_natural_wrap_mode(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_mnemonic_widget(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_mnemonic_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_markup_with_mnemonic(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_markup_with_mnemonic(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_markup(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_markup(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_label(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_justify(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_justify(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_ellipsize(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_ellipsize(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_label_set_attributes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_select_region(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_label_select_region(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_wrap_mode(value self)
{
CAMLparam1(self);
PangoWrapMode result = gtk_label_get_wrap_mode(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_label_get_text(value self)
{
CAMLparam1(self);
const char* result = gtk_label_get_text(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_label_get_tabs(value self)
{
CAMLparam1(self);
void *result = gtk_label_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_selection_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_label_get_selection_bounds(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_label_get_natural_wrap_mode(value self)
{
CAMLparam1(self);
GtkNaturalWrapMode result = gtk_label_get_natural_wrap_mode(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_label_get_mnemonic_widget(value self)
{
CAMLparam1(self);
GtkWidget* result = gtk_label_get_mnemonic_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_label_get_layout_offsets(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_label_get_layout_offsets(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_layout(value self)
{
CAMLparam1(self);
void *result = gtk_label_get_layout(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_label(value self)
{
CAMLparam1(self);
const char* result = gtk_label_get_label(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_label_get_justify(value self)
{
CAMLparam1(self);
GtkJustification result = gtk_label_get_justify(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_label_get_extra_menu(value self)
{
CAMLparam1(self);
void *result = gtk_label_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_ellipsize(value self)
{
CAMLparam1(self);
PangoEllipsizeMode result = gtk_label_get_ellipsize(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_label_get_current_uri(value self)
{
CAMLparam1(self);
const char* result = gtk_label_get_current_uri(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_label_get_attributes(value self)
{
CAMLparam1(self);
void *result = gtk_label_get_attributes(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_lines(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_max_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_max_width_chars(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_mnemonic_keyval(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "mnemonic-keyval", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_get_selectable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "selectable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_selectable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "selectable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_single_line_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "single-line-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_single_line_mode(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "single-line-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_use_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-markup", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_use_markup(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_width_chars(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_wrap(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_xalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "yalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_yalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "yalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_link_button_new(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_link_button_new_with_label(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_link_button_new_with_label(String_val(arg1), String_val(arg2));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_link_button_set_uri(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_link_button_set_uri(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_get_uri(value self)
{
CAMLparam1(self);
const char* result = gtk_link_button_get_uri(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_link_button_get_visited(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visited", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_link_button_set_visited(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visited", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_menu_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_menu_button_set_popover(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_menu_button_set_popover(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_menu_model(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_menu_button_set_menu_model(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_menu_button_set_label(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_menu_button_set_icon_name(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_direction(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_menu_button_set_direction(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_create_popup_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_menu_button_set_create_popup_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_menu_button_set_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_popup(value self)
{
CAMLparam1(self);
gtk_menu_button_popup(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_popdown(value self)
{
CAMLparam1(self);
gtk_menu_button_popdown(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_popover(value self)
{
CAMLparam1(self);
void *result = gtk_menu_button_get_popover(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_get_menu_model(value self)
{
CAMLparam1(self);
void *result = gtk_menu_button_get_menu_model(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_get_label(value self)
{
CAMLparam1(self);
const char* result = gtk_menu_button_get_label(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_menu_button_get_icon_name(value self)
{
CAMLparam1(self);
const char* result = gtk_menu_button_get_icon_name(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_menu_button_get_direction(value self)
{
CAMLparam1(self);
GtkArrowType result = gtk_menu_button_get_direction(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_menu_button_get_child(value self)
{
CAMLparam1(self);
GtkWidget* result = gtk_menu_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_menu_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_always_show_arrow(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "always-show-arrow", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_always_show_arrow(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "always-show-arrow", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-shrink", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_can_shrink(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "can-shrink", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_has_frame(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_primary(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_primary(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_use_underline(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_password_entry_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_password_entry_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_password_entry_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_get_extra_menu(value self)
{
CAMLparam1(self);
void *result = gtk_password_entry_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_password_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_password_entry_set_activates_default(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_get_show_peek_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-peek-icon", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_password_entry_set_show_peek_icon(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-peek-icon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_search_entry_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_search_entry_set_placeholder_text(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_search_entry_set_placeholder_text(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_search_entry_set_key_capture_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_search_entry_set_input_purpose(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_search_entry_set_input_hints(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
const char* result = gtk_search_entry_get_placeholder_text(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_search_entry_get_key_capture_widget(value self)
{
CAMLparam1(self);
GtkWidget* result = gtk_search_entry_get_key_capture_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_search_entry_get_input_purpose(value self)
{
CAMLparam1(self);
GtkInputPurpose result = gtk_search_entry_get_input_purpose(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_search_entry_get_input_hints(value self)
{
CAMLparam1(self);
GtkInputHints result = gtk_search_entry_get_input_hints(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_search_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_search_entry_set_activates_default(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_get_search_delay(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "search-delay", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_search_entry_set_search_delay(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "search-delay", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_new(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_spin_button_new(arg1, arg2, Int_val(arg3));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_spin_button_new_with_range(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_spin_button_new_with_range(arg1, arg2, arg3);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_spin_button_update(value self)
{
CAMLparam1(self);
gtk_spin_button_update(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_spin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_spin_button_spin(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_update_policy(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_spin_button_set_update_policy(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_spin_button_set_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_spin_button_set_increments(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_spin_button_set_adjustment(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_value_as_int(value self)
{
CAMLparam1(self);
void *result = gtk_spin_button_get_value_as_int(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_spin_button_get_update_policy(value self)
{
CAMLparam1(self);
GtkSpinButtonUpdatePolicy result = gtk_spin_button_get_update_policy(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_spin_button_get_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_spin_button_get_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_spin_button_get_increments(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_adjustment(value self)
{
CAMLparam1(self);
void *result = gtk_spin_button_get_adjustment(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_spin_button_configure(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_spin_button_configure(GtkWidget_val(self), arg1, arg2, Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_activates_default(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_climb_rate(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "climb-rate", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_climb_rate(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "climb-rate", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_digits(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "digits", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_digits(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "digits", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_numeric(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "numeric", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_numeric(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "numeric", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_snap_to_ticks(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "snap-to-ticks", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_snap_to_ticks(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "snap-to-ticks", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_value(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_wrap(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_switch_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_switch_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_switch_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_switch_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_switch_get_state(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "state", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_switch_set_state(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "state", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_toggle_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_toggle_button_new_with_label(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_toggle_button_new_with_label(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_toggle_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_toggle_button_new_with_mnemonic(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_toggle_button_toggled(value self)
{
CAMLparam1(self);
gtk_toggle_button_toggled(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_toggle_button_set_group(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_toggle_button_set_active(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "active", c_value, NULL);
CAMLreturn(Val_unit);
}
