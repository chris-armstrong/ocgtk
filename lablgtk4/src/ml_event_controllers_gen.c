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

/* Phase 5: Widget type conversions */
#define GtkWidget_val(val) ((GtkWidget*)Pointer_val(val))
#define Val_GtkWidget(obj) ((value)(obj))


CAMLprim value ml_gtk_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_new_from_icon_name(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_button_new_from_icon_name();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_button_new_with_label();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_button_new_with_mnemonic();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_button_set_use_underline(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_use_underline(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_label(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_label(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_icon_name(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_icon_name(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_has_frame(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_has_frame(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_child(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_can_shrink(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_can_shrink(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_use_underline(value self)
{
CAMLparam1(value self);
gboolean result = gtk_button_get_use_underline(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_button_get_label(value self)
{
CAMLparam1(value self);
void *result = gtk_button_get_label(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_button_get_icon_name(value self)
{
CAMLparam1(value self);
void *result = gtk_button_get_icon_name(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_button_get_has_frame(value self)
{
CAMLparam1(value self);
gboolean result = gtk_button_get_has_frame(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_button_get_child(value self)
{
CAMLparam1(value self);
GtkWidget* result = gtk_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_button_get_can_shrink(value self)
{
CAMLparam1(value self);
gboolean result = gtk_button_get_can_shrink(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_button_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "can-shrink", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_button_get_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget value;
g_object_get(G_OBJECT(obj), "child", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_button_set_child(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "child", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "has-frame", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_button_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "icon-name", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_button_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "label", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_button_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "use-underline", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_check_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_check_button_new_with_label();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_check_button_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_check_button_new_with_mnemonic();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_check_button_set_use_underline(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_use_underline(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_label(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_label(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_inconsistent(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_inconsistent(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_group(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_group(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_child(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_active(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_active(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_use_underline(value self)
{
CAMLparam1(value self);
gboolean result = gtk_check_button_get_use_underline(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_check_button_get_label(value self)
{
CAMLparam1(value self);
void *result = gtk_check_button_get_label(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_check_button_get_inconsistent(value self)
{
CAMLparam1(value self);
gboolean result = gtk_check_button_get_inconsistent(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_check_button_get_child(value self)
{
CAMLparam1(value self);
GtkWidget* result = gtk_check_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_check_button_get_active(value self)
{
CAMLparam1(value self);
gboolean result = gtk_check_button_get_active(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_check_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "active", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_check_button_get_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget value;
g_object_get(G_OBJECT(obj), "child", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_check_button_set_child(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "child", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_group(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
CheckButton value;
g_object_get(G_OBJECT(obj), "group", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_check_button_set_group(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
CheckButton c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "group", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_inconsistent(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "inconsistent", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_check_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "label", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_check_button_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "use-underline", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_new_with_buffer(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_entry_new_with_buffer();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_entry_unset_invisible_char(value self)
{
CAMLparam1(value self);
gtk_entry_unset_invisible_char(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_visibility(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_visibility(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_tabs(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_progress_pulse_step(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_progress_pulse_step(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_progress_fraction(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_progress_fraction(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_placeholder_text(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_placeholder_text(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_overwrite_mode(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_overwrite_mode(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_max_length(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_max_length(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_invisible_char(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_invisible_char(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_input_purpose(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_input_hints(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_tooltip_text(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_set_icon_tooltip_text(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_tooltip_markup(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_set_icon_tooltip_markup(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_sensitive(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_set_icon_sensitive(GtkWidget_val(self), arg1, Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_from_paintable(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_set_icon_from_paintable(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_from_icon_name(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_set_icon_from_icon_name(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_from_gicon(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_set_icon_from_gicon(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_drag_source(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(value self, value arg1, value arg2, value arg3);
gtk_entry_set_icon_drag_source(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_icon_activatable(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_set_icon_activatable(GtkWidget_val(self), arg1, Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_has_frame(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_has_frame(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_extra_menu(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_completion(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_completion(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_buffer(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_buffer(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_attributes(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_attributes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_alignment(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_alignment(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_activates_default(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_activates_default(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_reset_im_context(value self)
{
CAMLparam1(value self);
gtk_entry_reset_im_context(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_progress_pulse(value self)
{
CAMLparam1(value self);
gtk_entry_progress_pulse(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_grab_focus_without_selecting(value self)
{
CAMLparam1(value self);
gboolean result = gtk_entry_grab_focus_without_selecting(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_visibility(value self)
{
CAMLparam1(value self);
gboolean result = gtk_entry_get_visibility(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_text_length(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_text_length(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_tabs(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_progress_pulse_step(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_progress_pulse_step(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_progress_fraction(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_progress_fraction(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_placeholder_text(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_placeholder_text(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_overwrite_mode(value self)
{
CAMLparam1(value self);
gboolean result = gtk_entry_get_overwrite_mode(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_max_length(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_max_length(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_invisible_char(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_invisible_char(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_input_purpose(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_input_purpose(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_input_hints(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_input_hints(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_tooltip_text(value self, value arg1)
{
CAMLparam2(value self, value arg1);
void *result = gtk_entry_get_icon_tooltip_text(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_tooltip_markup(value self, value arg1)
{
CAMLparam2(value self, value arg1);
void *result = gtk_entry_get_icon_tooltip_markup(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_storage_type(value self, value arg1)
{
CAMLparam2(value self, value arg1);
void *result = gtk_entry_get_icon_storage_type(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_sensitive(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gboolean result = gtk_entry_get_icon_sensitive(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_icon_paintable(value self, value arg1)
{
CAMLparam2(value self, value arg1);
void *result = gtk_entry_get_icon_paintable(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_name(value self, value arg1)
{
CAMLparam2(value self, value arg1);
void *result = gtk_entry_get_icon_name(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_gicon(value self, value arg1)
{
CAMLparam2(value self, value arg1);
void *result = gtk_entry_get_icon_gicon(GtkWidget_val(self), arg1);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
void *result = gtk_entry_get_icon_at_pos(GtkWidget_val(self), arg1, arg2);
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_icon_area(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_entry_get_icon_area(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_icon_activatable(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gboolean result = gtk_entry_get_icon_activatable(GtkWidget_val(self), arg1);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_has_frame(value self)
{
CAMLparam1(value self);
gboolean result = gtk_entry_get_has_frame(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_extra_menu(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_current_icon_drag_source(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_current_icon_drag_source(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_completion(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_completion(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_buffer(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_buffer(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_attributes(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_attributes(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_alignment(value self)
{
CAMLparam1(value self);
void *result = gtk_entry_get_alignment(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_entry_get_activates_default(value self)
{
CAMLparam1(value self);
gboolean result = gtk_entry_get_activates_default(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "activates-default", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_attributes(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.AttrList value;
g_object_get(G_OBJECT(obj), "attributes", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_attributes(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.AttrList c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "attributes", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_buffer(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
EntryBuffer value;
g_object_get(G_OBJECT(obj), "buffer", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_buffer(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
EntryBuffer c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "buffer", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
EntryCompletion value;
g_object_get(G_OBJECT(obj), "completion", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_completion(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
EntryCompletion c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "completion", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_enable_emoji_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "enable-emoji-completion", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_extra_menu(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel value;
g_object_get(G_OBJECT(obj), "extra-menu", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_extra_menu(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "extra-menu", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "has-frame", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_im_module(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "im-module", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_im_module(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "im-module", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_input_hints(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputHints value;
g_object_get(G_OBJECT(obj), "input-hints", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_input_hints(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputHints c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "input-hints", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_input_purpose(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputPurpose value;
g_object_get(G_OBJECT(obj), "input-purpose", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_input_purpose(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputPurpose c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "input-purpose", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_invisible_char(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint value;
g_object_get(G_OBJECT(obj), "invisible-char", &value, NULL);
result = Val_int(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "invisible-char-set", &value, NULL);
result = Val_bool(value);
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
gint value;
g_object_get(G_OBJECT(obj), "max-length", &value, NULL);
result = Val_int(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "overwrite-mode", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "placeholder-text", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_placeholder_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_primary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "primary-icon-activatable", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_primary_icon_gicon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.Icon value;
g_object_get(G_OBJECT(obj), "primary-icon-gicon", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_primary_icon_gicon(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.Icon c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-gicon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_primary_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "primary-icon-name", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_primary_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_primary_icon_paintable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gdk.Paintable value;
g_object_get(G_OBJECT(obj), "primary-icon-paintable", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_primary_icon_paintable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gdk.Paintable c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-paintable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_primary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "primary-icon-sensitive", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_primary_icon_storage_type(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
ImageType value;
g_object_get(G_OBJECT(obj), "primary-icon-storage-type", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_get_primary_icon_tooltip_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "primary-icon-tooltip-markup", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_primary_icon_tooltip_markup(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-tooltip-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_primary_icon_tooltip_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "primary-icon-tooltip-text", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_primary_icon_tooltip_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-tooltip-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_progress_fraction(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble value;
g_object_get(G_OBJECT(obj), "progress-fraction", &value, NULL);
result = caml_copy_double(value);
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
gdouble value;
g_object_get(G_OBJECT(obj), "progress-pulse-step", &value, NULL);
result = caml_copy_double(value);
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
gint value;
g_object_get(G_OBJECT(obj), "scroll-offset", &value, NULL);
result = Val_int(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "secondary-icon-activatable", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_secondary_icon_gicon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.Icon value;
g_object_get(G_OBJECT(obj), "secondary-icon-gicon", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_secondary_icon_gicon(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.Icon c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-gicon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "secondary-icon-name", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_secondary_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_paintable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gdk.Paintable value;
g_object_get(G_OBJECT(obj), "secondary-icon-paintable", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_secondary_icon_paintable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gdk.Paintable c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-paintable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "secondary-icon-sensitive", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_secondary_icon_storage_type(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
ImageType value;
g_object_get(G_OBJECT(obj), "secondary-icon-storage-type", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_tooltip_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "secondary-icon-tooltip-markup", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_secondary_icon_tooltip_markup(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-tooltip-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_secondary_icon_tooltip_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "secondary-icon-tooltip-text", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_secondary_icon_tooltip_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-tooltip-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_show_emoji_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "show-emoji-icon", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_entry_get_tabs(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.TabArray value;
g_object_get(G_OBJECT(obj), "tabs", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_set_tabs(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.TabArray c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "tabs", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_get_text_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint value;
g_object_get(G_OBJECT(obj), "text-length", &value, NULL);
result = Val_int(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_entry_get_truncate_multiline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "truncate-multiline", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "visibility", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_image_new_from_file(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new_from_file();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_gicon(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new_from_gicon();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_icon_name(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new_from_icon_name();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_paintable(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new_from_paintable();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_pixbuf(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new_from_pixbuf();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_new_from_resource(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_image_new_from_resource();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_image_set_pixel_size(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_pixel_size(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_icon_size(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_icon_size(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_resource(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_resource(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_pixbuf(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_pixbuf(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_paintable(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_paintable(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_icon_name(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_icon_name(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_gicon(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_gicon(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_file(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_file(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_storage_type(value self)
{
CAMLparam1(value self);
void *result = gtk_image_get_storage_type(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_get_pixel_size(value self)
{
CAMLparam1(value self);
void *result = gtk_image_get_pixel_size(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_get_paintable(value self)
{
CAMLparam1(value self);
void *result = gtk_image_get_paintable(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_get_icon_size(value self)
{
CAMLparam1(value self);
void *result = gtk_image_get_icon_size(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_get_icon_name(value self)
{
CAMLparam1(value self);
void *result = gtk_image_get_icon_name(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_get_gicon(value self)
{
CAMLparam1(value self);
void *result = gtk_image_get_gicon(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_image_clear(value self)
{
CAMLparam1(value self);
gtk_image_clear(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_file(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "file", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_file(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "file", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_gicon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.Icon value;
g_object_get(G_OBJECT(obj), "gicon", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_gicon(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.Icon c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "gicon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "icon-name", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_icon_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
IconSize value;
g_object_get(G_OBJECT(obj), "icon-size", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_icon_size(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
IconSize c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "icon-size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_paintable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gdk.Paintable value;
g_object_get(G_OBJECT(obj), "paintable", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_paintable(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gdk.Paintable c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "paintable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_pixel_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint value;
g_object_get(G_OBJECT(obj), "pixel-size", &value, NULL);
result = Val_int(value);
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

CAMLprim value ml_gtk_image_get_resource(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "resource", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_set_resource(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "resource", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_get_storage_type(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
ImageType value;
g_object_get(G_OBJECT(obj), "storage-type", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_image_get_use_fallback(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "use-fallback", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_label_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_label_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_label_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_label_new_with_mnemonic();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_label_set_yalign(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_yalign(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_xalign(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_xalign(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_wrap_mode(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_wrap_mode(GtkWidget_val(self), PangoWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_wrap(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_wrap(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_width_chars(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_width_chars(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_use_underline(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_use_underline(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_use_markup(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_use_markup(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_text_with_mnemonic(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_text_with_mnemonic(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_text(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_text(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_tabs(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_tabs(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_single_line_mode(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_single_line_mode(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_selectable(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_selectable(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_natural_wrap_mode(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_natural_wrap_mode(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_mnemonic_widget(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_mnemonic_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_max_width_chars(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_max_width_chars(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_markup_with_mnemonic(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_markup_with_mnemonic(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_markup(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_markup(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_lines(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_lines(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_label(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_label(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_justify(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_justify(GtkWidget_val(self), Justification_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_extra_menu(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_ellipsize(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_ellipsize(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_attributes(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_attributes(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_select_region(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_label_select_region(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_yalign(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_yalign(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_xalign(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_xalign(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_wrap_mode(value self)
{
CAMLparam1(value self);
PangoWrapMode result = gtk_label_get_wrap_mode(GtkWidget_val(self));
CAMLreturn(Val_PangoWrapMode(result));
}

CAMLprim value ml_gtk_label_get_wrap(value self)
{
CAMLparam1(value self);
gboolean result = gtk_label_get_wrap(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_label_get_width_chars(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_width_chars(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_use_underline(value self)
{
CAMLparam1(value self);
gboolean result = gtk_label_get_use_underline(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_label_get_use_markup(value self)
{
CAMLparam1(value self);
gboolean result = gtk_label_get_use_markup(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_label_get_text(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_text(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_tabs(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_tabs(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_single_line_mode(value self)
{
CAMLparam1(value self);
gboolean result = gtk_label_get_single_line_mode(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_label_get_selection_bounds(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gboolean result = gtk_label_get_selection_bounds(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_label_get_selectable(value self)
{
CAMLparam1(value self);
gboolean result = gtk_label_get_selectable(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_label_get_natural_wrap_mode(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_natural_wrap_mode(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_mnemonic_widget(value self)
{
CAMLparam1(value self);
GtkWidget* result = gtk_label_get_mnemonic_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_label_get_mnemonic_keyval(value self)
{
CAMLparam1(value self);
guint result = gtk_label_get_mnemonic_keyval(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_label_get_max_width_chars(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_max_width_chars(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_lines(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_lines(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_layout_offsets(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_label_get_layout_offsets(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_layout(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_layout(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_label(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_label(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_justify(value self)
{
CAMLparam1(value self);
GtkJustification result = gtk_label_get_justify(GtkWidget_val(self));
CAMLreturn(Val_justification(result));
}

CAMLprim value ml_gtk_label_get_extra_menu(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_ellipsize(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_ellipsize(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_current_uri(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_current_uri(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_attributes(value self)
{
CAMLparam1(value self);
void *result = gtk_label_get_attributes(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_label_get_attributes(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.AttrList value;
g_object_get(G_OBJECT(obj), "attributes", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_attributes(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.AttrList c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "attributes", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_ellipsize(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.EllipsizeMode value;
g_object_get(G_OBJECT(obj), "ellipsize", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_ellipsize(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.EllipsizeMode c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "ellipsize", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_extra_menu(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel value;
g_object_get(G_OBJECT(obj), "extra-menu", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_extra_menu(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "extra-menu", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_justify(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Justification value;
g_object_get(G_OBJECT(obj), "justify", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_justify(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Justification c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "justify", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "label", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_lines(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gint value;
g_object_get(G_OBJECT(obj), "lines", &value, NULL);
result = Val_int(value);
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
gint value;
g_object_get(G_OBJECT(obj), "max-width-chars", &value, NULL);
result = Val_int(value);
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
guint value;
g_object_get(G_OBJECT(obj), "mnemonic-keyval", &value, NULL);
result = Val_int(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_get_mnemonic_widget(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget value;
g_object_get(G_OBJECT(obj), "mnemonic-widget", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_mnemonic_widget(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "mnemonic-widget", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_natural_wrap_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
NaturalWrapMode value;
g_object_get(G_OBJECT(obj), "natural-wrap-mode", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_natural_wrap_mode(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
NaturalWrapMode c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "natural-wrap-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_selectable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "selectable", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "single-line-mode", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_label_get_tabs(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.TabArray value;
g_object_get(G_OBJECT(obj), "tabs", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_tabs(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.TabArray c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "tabs", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_use_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "use-markup", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "use-underline", &value, NULL);
result = Val_bool(value);
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
gint value;
g_object_get(G_OBJECT(obj), "width-chars", &value, NULL);
result = Val_int(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "wrap", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_label_get_wrap_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.WrapMode value;
g_object_get(G_OBJECT(obj), "wrap-mode", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_wrap_mode(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Pango.WrapMode c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "wrap-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat value;
g_object_get(G_OBJECT(obj), "xalign", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_xalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat value;
g_object_get(G_OBJECT(obj), "yalign", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_label_set_yalign(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gfloat c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "yalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_link_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_link_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_link_button_new_with_label();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_link_button_set_visited(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_link_button_set_visited(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_set_uri(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_link_button_set_uri(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_get_visited(value self)
{
CAMLparam1(value self);
gboolean result = gtk_link_button_get_visited(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_link_button_get_uri(value self)
{
CAMLparam1(value self);
void *result = gtk_link_button_get_uri(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_link_button_get_uri(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "uri", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_link_button_set_uri(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "uri", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_get_visited(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "visited", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_menu_button_set_use_underline(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_use_underline(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_primary(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_primary(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_popover(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_popover(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_menu_model(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_menu_model(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_label(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_label(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_icon_name(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_icon_name(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_has_frame(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_has_frame(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_direction(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_direction(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_create_popup_func(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(value self, value arg1, value arg2, value arg3);
gtk_menu_button_set_create_popup_func(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_child(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_child(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_can_shrink(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_can_shrink(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_always_show_arrow(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_always_show_arrow(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_active(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_active(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_popup(value self)
{
CAMLparam1(value self);
gtk_menu_button_popup(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_popdown(value self)
{
CAMLparam1(value self);
gtk_menu_button_popdown(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_use_underline(value self)
{
CAMLparam1(value self);
gboolean result = gtk_menu_button_get_use_underline(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_menu_button_get_primary(value self)
{
CAMLparam1(value self);
gboolean result = gtk_menu_button_get_primary(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_menu_button_get_popover(value self)
{
CAMLparam1(value self);
void *result = gtk_menu_button_get_popover(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_get_menu_model(value self)
{
CAMLparam1(value self);
void *result = gtk_menu_button_get_menu_model(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_get_label(value self)
{
CAMLparam1(value self);
void *result = gtk_menu_button_get_label(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_get_icon_name(value self)
{
CAMLparam1(value self);
void *result = gtk_menu_button_get_icon_name(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_get_has_frame(value self)
{
CAMLparam1(value self);
gboolean result = gtk_menu_button_get_has_frame(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_menu_button_get_direction(value self)
{
CAMLparam1(value self);
void *result = gtk_menu_button_get_direction(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_get_child(value self)
{
CAMLparam1(value self);
GtkWidget* result = gtk_menu_button_get_child(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_menu_button_get_can_shrink(value self)
{
CAMLparam1(value self);
gboolean result = gtk_menu_button_get_can_shrink(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_menu_button_get_always_show_arrow(value self)
{
CAMLparam1(value self);
gboolean result = gtk_menu_button_get_always_show_arrow(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_menu_button_get_active(value self)
{
CAMLparam1(value self);
gboolean result = gtk_menu_button_get_active(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_menu_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "active", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "always-show-arrow", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "can-shrink", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_menu_button_get_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget value;
g_object_get(G_OBJECT(obj), "child", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_child(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Widget c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "child", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_direction(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
ArrowType value;
g_object_get(G_OBJECT(obj), "direction", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_direction(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
ArrowType c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "direction", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "has-frame", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_menu_button_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "icon-name", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_icon_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "label", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_menu_model(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel value;
g_object_get(G_OBJECT(obj), "menu-model", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_menu_model(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "menu-model", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_popover(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Popover value;
g_object_get(G_OBJECT(obj), "popover", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_menu_button_set_popover(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Popover c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "popover", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_get_primary(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "primary", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "use-underline", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_password_entry_set_show_peek_icon(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_password_entry_set_show_peek_icon(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_set_extra_menu(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_password_entry_set_extra_menu(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_get_show_peek_icon(value self)
{
CAMLparam1(value self);
gboolean result = gtk_password_entry_get_show_peek_icon(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_password_entry_get_extra_menu(value self)
{
CAMLparam1(value self);
void *result = gtk_password_entry_get_extra_menu(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_password_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "activates-default", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_password_entry_get_extra_menu(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel value;
g_object_get(G_OBJECT(obj), "extra-menu", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_password_entry_set_extra_menu(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Gio.MenuModel c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "extra-menu", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "placeholder-text", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_password_entry_set_placeholder_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_get_show_peek_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "show-peek-icon", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_search_entry_set_search_delay(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_search_delay(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_placeholder_text(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_placeholder_text(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_key_capture_widget(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_input_purpose(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_input_hints(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_get_search_delay(value self)
{
CAMLparam1(value self);
guint result = gtk_search_entry_get_search_delay(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_search_entry_get_placeholder_text(value self)
{
CAMLparam1(value self);
void *result = gtk_search_entry_get_placeholder_text(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_search_entry_get_key_capture_widget(value self)
{
CAMLparam1(value self);
GtkWidget* result = gtk_search_entry_get_key_capture_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLprim value ml_gtk_search_entry_get_input_purpose(value self)
{
CAMLparam1(value self);
void *result = gtk_search_entry_get_input_purpose(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_search_entry_get_input_hints(value self)
{
CAMLparam1(value self);
void *result = gtk_search_entry_get_input_hints(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_search_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "activates-default", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_search_entry_get_input_hints(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputHints value;
g_object_get(G_OBJECT(obj), "input-hints", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_search_entry_set_input_hints(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputHints c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "input-hints", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_get_input_purpose(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputPurpose value;
g_object_get(G_OBJECT(obj), "input-purpose", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_search_entry_set_input_purpose(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
InputPurpose c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "input-purpose", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* value;
g_object_get(G_OBJECT(obj), "placeholder-text", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_search_entry_set_placeholder_text(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gchar* c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_get_search_delay(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
guint value;
g_object_get(G_OBJECT(obj), "search-delay", &value, NULL);
result = Val_int(value);
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

CAMLprim value ml_gtk_spin_button_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_spin_button_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_spin_button_new_with_range(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_spin_button_new_with_range();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_spin_button_update(value self)
{
CAMLparam1(value self);
gtk_spin_button_update(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_spin(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_spin_button_spin(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_wrap(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_wrap(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_value(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_value(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_update_policy(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_update_policy(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_snap_to_ticks(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_snap_to_ticks(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_range(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_spin_button_set_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_numeric(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_numeric(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_increments(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_spin_button_set_increments(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_digits(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_digits(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_climb_rate(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_climb_rate(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_adjustment(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_adjustment(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_activates_default(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_activates_default(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_wrap(value self)
{
CAMLparam1(value self);
gboolean result = gtk_spin_button_get_wrap(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_spin_button_get_value_as_int(value self)
{
CAMLparam1(value self);
void *result = gtk_spin_button_get_value_as_int(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_spin_button_get_value(value self)
{
CAMLparam1(value self);
void *result = gtk_spin_button_get_value(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_spin_button_get_update_policy(value self)
{
CAMLparam1(value self);
void *result = gtk_spin_button_get_update_policy(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_spin_button_get_snap_to_ticks(value self)
{
CAMLparam1(value self);
gboolean result = gtk_spin_button_get_snap_to_ticks(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_spin_button_get_range(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_spin_button_get_range(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_numeric(value self)
{
CAMLparam1(value self);
gboolean result = gtk_spin_button_get_numeric(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_spin_button_get_increments(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_spin_button_get_increments(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_digits(value self)
{
CAMLparam1(value self);
guint result = gtk_spin_button_get_digits(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLprim value ml_gtk_spin_button_get_climb_rate(value self)
{
CAMLparam1(value self);
void *result = gtk_spin_button_get_climb_rate(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_spin_button_get_adjustment(value self)
{
CAMLparam1(value self);
void *result = gtk_spin_button_get_adjustment(GtkWidget_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_spin_button_get_activates_default(value self)
{
CAMLparam1(value self);
gboolean result = gtk_spin_button_get_activates_default(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_spin_button_configure(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(value self, value arg1, value arg2, value arg3);
gtk_spin_button_configure(GtkWidget_val(self), arg1, arg2, Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "activates-default", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_spin_button_get_adjustment(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Adjustment value;
g_object_get(G_OBJECT(obj), "adjustment", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_adjustment(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
Adjustment c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "adjustment", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_climb_rate(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble value;
g_object_get(G_OBJECT(obj), "climb-rate", &value, NULL);
result = caml_copy_double(value);
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
guint value;
g_object_get(G_OBJECT(obj), "digits", &value, NULL);
result = Val_int(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "numeric", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "snap-to-ticks", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_spin_button_get_update_policy(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
SpinButtonUpdatePolicy value;
g_object_get(G_OBJECT(obj), "update-policy", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_spin_button_set_update_policy(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
SpinButtonUpdatePolicy c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "update-policy", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gdouble value;
g_object_get(G_OBJECT(obj), "value", &value, NULL);
result = caml_copy_double(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "wrap", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_switch_set_state(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_switch_set_state(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_switch_set_active(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_switch_set_active(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_switch_get_state(value self)
{
CAMLparam1(value self);
gboolean result = gtk_switch_get_state(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_switch_get_active(value self)
{
CAMLparam1(value self);
gboolean result = gtk_switch_get_active(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_switch_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "active", &value, NULL);
result = Val_bool(value);
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
gboolean value;
g_object_get(G_OBJECT(obj), "state", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_toggle_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_toggle_button_new_with_label();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_toggle_button_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_toggle_button_new_with_mnemonic();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLprim value ml_gtk_toggle_button_toggled(value self)
{
CAMLparam1(value self);
gtk_toggle_button_toggled(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_set_group(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_toggle_button_set_group(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_set_active(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_toggle_button_set_active(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_get_active(value self)
{
CAMLparam1(value self);
gboolean result = gtk_toggle_button_get_active(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_toggle_button_get_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean value;
g_object_get(G_OBJECT(obj), "active", &value, NULL);
result = Val_bool(value);
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

CAMLprim value ml_gtk_toggle_button_get_group(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
ToggleButton value;
g_object_get(G_OBJECT(obj), "group", &value, NULL);
result = Val_unit(value);
CAMLreturn(result);
}

CAMLprim value ml_gtk_toggle_button_set_group(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
ToggleButton c_value = Unit_val(new_value);
g_object_set(G_OBJECT(obj), "group", c_value, NULL);
CAMLreturn(Val_unit);
}
