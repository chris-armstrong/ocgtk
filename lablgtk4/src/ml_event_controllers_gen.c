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
#define GtkEventController_val(val) ((GtkEventController*)ext_of_val(val))
#define Val_GtkEventController(obj) ((value)(val_of_ext(obj)))
/* Note: GtkWidget_val and Val_GtkWidget are defined in wrappers.h */

/* Phase 5.3: Option type conversions for nullable parameters */
#define GtkWidget_option_val(v) ((v) == Val_none ? NULL : GtkWidget_val(Some_val(v)))
#define GtkEventController_option_val(v) ((v) == Val_none ? NULL : GtkEventController_val(Some_val(v)))

/* GdkEvent conversions - from ml_event_controller.c */
#define GdkEvent_val(val) ((GdkEvent*)ext_of_val(val))
#define Val_GdkEvent(obj) ((value)(val_of_ext(obj)))


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
gtk_button_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
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
GtkWidget *widget = gtk_check_button_new_with_label((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_check_button_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_check_button_new_with_mnemonic((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_check_button_set_label(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_check_button_set_label(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_group(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_check_button_set_group(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_check_button_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
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
GtkWidget *widget = gtk_entry_new_with_buffer(GtkWidget_val(arg1));
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
gtk_entry_set_placeholder_text(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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
gtk_entry_set_icon_tooltip_text(GtkWidget_val(self), arg1, (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_tooltip_markup(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_entry_set_icon_tooltip_markup(GtkWidget_val(self), arg1, (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
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
gtk_entry_set_icon_from_icon_name(GtkWidget_val(self), arg1, (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
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
gtk_entry_set_completion(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_entry_set_buffer(GtkWidget_val(self), GtkWidget_val(arg1));
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
GtkEntryCompletion* result = gtk_entry_get_completion(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_entry_get_buffer(value self)
{
CAMLparam1(self);
GtkEntryBuffer* result = gtk_entry_get_buffer(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
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
GtkWidget *widget = gtk_image_new_from_icon_name((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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
gtk_image_set_from_resource(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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
gtk_image_set_from_icon_name(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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
gtk_image_set_from_file(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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
GtkWidget *widget = gtk_label_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_label_new_with_mnemonic(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_label_new_with_mnemonic((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
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
gtk_label_set_mnemonic_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
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
GtkWidget *widget = gtk_link_button_new_with_label(String_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
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
gtk_menu_button_set_popover(GtkWidget_val(self), GtkWidget_option_val(arg1));
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
gtk_menu_button_set_child(GtkWidget_val(self), GtkWidget_option_val(arg1));
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
GtkPopover* result = gtk_menu_button_get_popover(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
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

CAMLprim value ml_gtk_password_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
const char *text = NULL;
g_object_get(G_OBJECT(obj), "placeholder-text", &text, NULL);
CAMLreturn(caml_copy_string(text ? text : ""));
}

CAMLprim value ml_gtk_password_entry_set_placeholder_text(value self, value text_opt)
{
CAMLparam2(self, text_opt);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
const char *text = Is_some(text_opt) ? String_val(Some_val(text_opt)) : NULL;
g_object_set(G_OBJECT(obj), "placeholder-text", text, NULL);
CAMLreturn(Val_unit);
}

/* GtkEditable interface methods */
CAMLprim value ml_gtk_editable_get_text(value self)
{
CAMLparam1(self);
const char* result = gtk_editable_get_text(GTK_EDITABLE(GtkWidget_val(self)));
CAMLreturn(caml_copy_string(result));
}

CAMLprim value ml_gtk_editable_set_text(value self, value text)
{
CAMLparam2(self, text);
gtk_editable_set_text(GTK_EDITABLE(GtkWidget_val(self)), String_val(text));
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
gtk_search_entry_set_placeholder_text(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_search_entry_set_key_capture_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
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
GtkWidget *widget = gtk_spin_button_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2, Int_val(arg3));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_spin_button_new_with_range(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkWidget *widget = gtk_spin_button_new_with_range(Double_val(arg1), Double_val(arg2), Double_val(arg3));
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
gtk_spin_button_set_range(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_increments(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_spin_button_set_increments(GtkWidget_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_adjustment(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_spin_button_set_adjustment(GtkWidget_val(self), GtkWidget_val(arg1));
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
GtkAdjustment* result = gtk_spin_button_get_adjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_spin_button_configure(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_spin_button_configure(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), arg2, Int_val(arg3));
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

CAMLprim value ml_gtk_text_buffer_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_text_buffer_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_text_buffer_undo(value self)
{
CAMLparam1(self);
gtk_text_buffer_undo(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_set_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_set_text(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_set_modified(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_set_modified(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_set_max_undo_levels(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_set_max_undo_levels(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_select_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_select_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_remove_tag_by_name(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_remove_tag_by_name(GtkWidget_val(self), String_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_remove_tag(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_remove_tag(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_remove_selection_clipboard(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_remove_selection_clipboard(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_remove_all_tags(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_remove_all_tags(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_redo(value self)
{
CAMLparam1(self);
gtk_text_buffer_redo(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_place_cursor(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_place_cursor(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_paste_clipboard(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_paste_clipboard(GtkWidget_val(self), arg1, (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), Bool_val(arg3));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_move_mark_by_name(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_move_mark_by_name(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_move_mark(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_move_mark(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_insert_range_interactive(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
gboolean result = gtk_text_buffer_insert_range_interactive(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, Bool_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_insert_range(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_insert_range(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_insert_paintable(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_insert_paintable(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_insert_markup(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_insert_markup(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_insert_interactive_at_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gboolean result = gtk_text_buffer_insert_interactive_at_cursor(GtkWidget_val(self), String_val(arg1), arg2, Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_insert_interactive(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
gboolean result = gtk_text_buffer_insert_interactive(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3, Bool_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_insert_child_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_insert_child_anchor(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_insert_at_cursor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_insert_at_cursor(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_insert(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_insert(GtkWidget_val(self), GtkWidget_val(arg1), String_val(arg2), arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_text(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
void *result = gtk_text_buffer_get_text(GtkWidget_val(self), arg1, arg2, Bool_val(arg3));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_buffer_get_tag_table(value self)
{
CAMLparam1(self);
GtkTextTagTable* result = gtk_text_buffer_get_tag_table(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_buffer_get_start_iter(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_get_start_iter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_slice(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
void *result = gtk_text_buffer_get_slice(GtkWidget_val(self), arg1, arg2, Bool_val(arg3));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_buffer_get_selection_content(value self)
{
CAMLparam1(self);
void *result = gtk_text_buffer_get_selection_content(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_buffer_get_selection_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_text_buffer_get_selection_bounds(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_get_selection_bound(value self)
{
CAMLparam1(self);
GtkTextMark* result = gtk_text_buffer_get_selection_bound(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_buffer_get_modified(value self)
{
CAMLparam1(self);
gboolean result = gtk_text_buffer_get_modified(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_get_max_undo_levels(value self)
{
CAMLparam1(self);
guint result = gtk_text_buffer_get_max_undo_levels(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_text_buffer_get_mark(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTextMark* result = gtk_text_buffer_get_mark(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_buffer_get_line_count(value self)
{
CAMLparam1(self);
void *result = gtk_text_buffer_get_line_count(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_get_iter_at_offset(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_mark(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_get_iter_at_mark(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_line_offset(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gboolean result = gtk_text_buffer_get_iter_at_line_offset(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_line_index(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gboolean result = gtk_text_buffer_get_iter_at_line_index(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_line(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_text_buffer_get_iter_at_line(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_child_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_get_iter_at_child_anchor(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_insert(value self)
{
CAMLparam1(self);
GtkTextMark* result = gtk_text_buffer_get_insert(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_buffer_get_end_iter(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_get_end_iter(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_char_count(value self)
{
CAMLparam1(self);
int result = gtk_text_buffer_get_char_count(GTK_TEXT_BUFFER(GtkWidget_val(self)));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_text_buffer_get_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_get_bounds(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_end_user_action(value self)
{
CAMLparam1(self);
gtk_text_buffer_end_user_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_end_irreversible_action(value self)
{
CAMLparam1(self);
gtk_text_buffer_end_irreversible_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_delete_selection(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_text_buffer_delete_selection(GtkWidget_val(self), Bool_val(arg1), Bool_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_delete_mark_by_name(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_delete_mark_by_name(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_delete_mark(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_delete_mark(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_delete_interactive(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gboolean result = gtk_text_buffer_delete_interactive(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_delete(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_delete(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_cut_clipboard(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_cut_clipboard(GtkWidget_val(self), arg1, Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_create_mark(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
GtkTextMark* result = gtk_text_buffer_create_mark(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), arg2, Bool_val(arg3));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_buffer_create_child_anchor(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTextChildAnchor* result = gtk_text_buffer_create_child_anchor(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_buffer_copy_clipboard(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_copy_clipboard(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_begin_user_action(value self)
{
CAMLparam1(self);
gtk_text_buffer_begin_user_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_begin_irreversible_action(value self)
{
CAMLparam1(self);
gtk_text_buffer_begin_irreversible_action(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_backspace(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gboolean result = gtk_text_buffer_backspace(GtkWidget_val(self), GtkWidget_val(arg1), Bool_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_buffer_apply_tag_by_name(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_apply_tag_by_name(GtkWidget_val(self), String_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_apply_tag(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_buffer_apply_tag(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_add_selection_clipboard(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_buffer_add_selection_clipboard(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_add_mark(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_buffer_add_mark(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_can_redo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-redo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_can_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_cursor_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "cursor-position", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_enable_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_set_enable_undo(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-undo", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_has_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_text_tag_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_text_tag_set_priority(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_tag_set_priority(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_priority(value self)
{
CAMLparam1(self);
void *result = gtk_text_tag_get_priority(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_tag_changed(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_tag_changed(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_accumulative_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "accumulative-margin", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_accumulative_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "accumulative-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_allow_breaks(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "allow-breaks", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_allow_breaks(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "allow-breaks", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_allow_breaks_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "allow-breaks-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_allow_breaks_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "allow-breaks-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_background_full_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "background-full-height", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_background_full_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "background-full-height", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_background_full_height_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "background-full-height-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_background_full_height_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "background-full-height-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_background_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "background-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_background_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "background-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_editable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_editable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_editable_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_editable_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "fallback", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_fallback(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "fallback", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_fallback_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "fallback-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_fallback_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "fallback-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_family_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "family-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_family_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "family-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_font_features_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "font-features-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_font_features_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "font-features-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_foreground_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "foreground-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_foreground_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "foreground-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_indent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "indent", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_indent(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "indent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_indent_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "indent-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_indent_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "indent-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_insert_hyphens(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "insert-hyphens", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_insert_hyphens(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "insert-hyphens", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_insert_hyphens_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "insert-hyphens-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_insert_hyphens_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "insert-hyphens-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_invisible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_invisible(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_invisible_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_invisible_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_justification_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "justification-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_justification_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "justification-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_language_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "language-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_language_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "language-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_left_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "left-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_left_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "left-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_left_margin_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "left-margin-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_left_margin_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "left-margin-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_letter_spacing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "letter-spacing", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_letter_spacing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "letter-spacing", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_letter_spacing_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "letter-spacing-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_letter_spacing_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "letter-spacing-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_line_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "line-height", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_line_height(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "line-height", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_line_height_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "line-height-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_line_height_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "line-height-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_overline_rgba_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overline-rgba-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_overline_rgba_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overline-rgba-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_overline_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overline-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_overline_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overline-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_paragraph_background_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "paragraph-background-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_paragraph_background_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "paragraph-background-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_pixels_above_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-above-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_pixels_above_lines(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-above-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_pixels_above_lines_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "pixels-above-lines-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_pixels_above_lines_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-above-lines-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_pixels_below_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-below-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_pixels_below_lines(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-below-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_pixels_below_lines_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "pixels-below-lines-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_pixels_below_lines_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-below-lines-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_pixels_inside_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-inside-wrap", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_pixels_inside_wrap(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-inside-wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_pixels_inside_wrap_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "pixels-inside-wrap-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_pixels_inside_wrap_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-inside-wrap-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_right_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "right-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_right_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "right-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_right_margin_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "right-margin-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_right_margin_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "right-margin-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_rise(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "rise", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_rise(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "rise", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_rise_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "rise-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_rise_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "rise-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_scale(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "scale", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_scale(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "scale", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_scale_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "scale-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_scale_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "scale-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_sentence(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "sentence", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_sentence(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "sentence", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_sentence_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "sentence-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_sentence_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "sentence-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_show_spaces_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-spaces-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_show_spaces_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-spaces-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_size(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_size_points(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "size-points", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_size_points(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "size-points", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_size_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "size-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_size_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "size-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_stretch_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "stretch-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_stretch_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "stretch-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_strikethrough(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_strikethrough(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_strikethrough_rgba_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough-rgba-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_strikethrough_rgba_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough-rgba-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_strikethrough_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_strikethrough_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_style_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "style-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_style_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "style-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_tabs_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "tabs-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_tabs_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "tabs-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_text_transform_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "text-transform-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_text_transform_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "text-transform-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_underline_rgba_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "underline-rgba-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_underline_rgba_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "underline-rgba-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_underline_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "underline-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_underline_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "underline-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_variant_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "variant-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_variant_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "variant-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_weight(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "weight", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_weight(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "weight", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_weight_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "weight-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_weight_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "weight-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_word(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "word", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_word(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "word", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_word_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "word-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_word_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "word-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_get_wrap_mode_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "wrap-mode-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_tag_set_wrap_mode_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "wrap-mode-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_table_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_text_tag_table_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_text_tag_table_remove(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_tag_table_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_table_lookup(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkTextTag* result = gtk_text_tag_table_lookup(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_tag_table_get_size(value self)
{
CAMLparam1(self);
void *result = gtk_text_tag_table_get_size(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_tag_table_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_tag_table_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_tag_table_add(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_tag_table_add(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_text_view_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_text_view_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_text_view_new_with_buffer(GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_text_view_starts_display_line(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_view_starts_display_line(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_set_wrap_mode(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_set_wrap_mode(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_set_tabs(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_set_justification(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_set_justification(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_set_input_purpose(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_set_input_hints(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_set_gutter(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_view_set_gutter(GtkWidget_val(self), Int_val(arg1), GtkWidget_option_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_set_extra_menu(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_set_buffer(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_scroll_mark_onscreen(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_scroll_mark_onscreen(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_reset_im_context(value self)
{
CAMLparam1(self);
gtk_text_view_reset_im_context(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_reset_cursor_blink(value self)
{
CAMLparam1(self);
gtk_text_view_reset_cursor_blink(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_remove(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_remove(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_place_cursor_onscreen(value self)
{
CAMLparam1(self);
gboolean result = gtk_text_view_place_cursor_onscreen(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_move_visually(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gboolean result = gtk_text_view_move_visually(GtkWidget_val(self), GtkWidget_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_move_overlay(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_view_move_overlay(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_move_mark_onscreen(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_view_move_mark_onscreen(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_im_context_filter_keypress(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_view_im_context_filter_keypress(GtkWidget_val(self), GdkEvent_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_get_wrap_mode(value self)
{
CAMLparam1(self);
GtkWrapMode result = gtk_text_view_get_wrap_mode(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_text_view_get_visible_rect(value self, value arg1)
{
CAMLparam2(self, arg1);
gtk_text_view_get_visible_rect(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_tabs(value self)
{
CAMLparam1(self);
void *result = gtk_text_view_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_view_get_rtl_context(value self)
{
CAMLparam1(self);
void *result = gtk_text_view_get_rtl_context(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_view_get_ltr_context(value self)
{
CAMLparam1(self);
void *result = gtk_text_view_get_ltr_context(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_view_get_line_yrange(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_view_get_line_yrange(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_line_at_y(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_view_get_line_at_y(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_justification(value self)
{
CAMLparam1(self);
GtkJustification result = gtk_text_view_get_justification(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_text_view_get_iter_location(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_view_get_iter_location(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_iter_at_position(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
gboolean result = gtk_text_view_get_iter_at_position(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3, arg4);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_get_iter_at_location(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gboolean result = gtk_text_view_get_iter_at_location(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_get_input_purpose(value self)
{
CAMLparam1(self);
GtkInputPurpose result = gtk_text_view_get_input_purpose(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_text_view_get_input_hints(value self)
{
CAMLparam1(self);
GtkInputHints result = gtk_text_view_get_input_hints(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_text_view_get_gutter(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkWidget* result = gtk_text_view_get_gutter(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_view_get_extra_menu(value self)
{
CAMLparam1(self);
void *result = gtk_text_view_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_text_view_get_cursor_locations(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_view_get_cursor_locations(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_buffer(value self)
{
CAMLparam1(self);
GtkTextBuffer* result = gtk_text_view_get_buffer(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_text_view_forward_display_line_end(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_view_forward_display_line_end(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_forward_display_line(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_view_forward_display_line(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_backward_display_line_start(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_view_backward_display_line_start(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_backward_display_line(value self, value arg1)
{
CAMLparam2(self, arg1);
gboolean result = gtk_text_view_backward_display_line(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_view_add_overlay(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
gtk_text_view_add_overlay(GtkWidget_val(self), GtkWidget_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_add_child_at_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
gtk_text_view_add_child_at_anchor(GtkWidget_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_accepts_tab(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "accepts-tab", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_accepts_tab(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "accepts-tab", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_bottom_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "bottom-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_bottom_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "bottom-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_cursor_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "cursor-visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_cursor_visible(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "cursor-visible", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_editable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_editable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_indent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "indent", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_indent(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "indent", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_left_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "left-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_left_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "left-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_monospace(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "monospace", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_monospace(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "monospace", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_overwrite(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overwrite", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_overwrite(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overwrite", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_pixels_above_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-above-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_pixels_above_lines(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-above-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_pixels_below_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-below-lines", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_pixels_below_lines(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-below-lines", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_pixels_inside_wrap(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pixels-inside-wrap", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_pixels_inside_wrap(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pixels-inside-wrap", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_right_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "right-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_right_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "right-margin", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_view_get_top_margin(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "top-margin", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_text_view_set_top_margin(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "top-margin", c_value, NULL);
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
gtk_toggle_button_set_group(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
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

/* Stub implementations for text_view functions with >5 parameters */
CAMLprim value ml_gtk_text_view_window_to_buffer_coords_native(value *argv, int argn)
{
return Val_unit;
}

CAMLprim value ml_gtk_text_view_buffer_to_window_coords_native(value *argv, int argn)
{
return Val_unit;
}

CAMLprim value ml_gtk_text_view_scroll_to_iter_native(value *argv, int argn)
{
return Val_bool(0);
}

CAMLprim value ml_gtk_text_view_scroll_to_mark_native(value *argv, int argn)
{
return Val_unit;
}
