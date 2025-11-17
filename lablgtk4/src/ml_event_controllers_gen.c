/* GENERATED CODE - DO NOT EDIT */
/* Generated from Gtk-4.0.gir for Phase 3 Event Controllers */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Event controller type conversion - use direct cast (GObjects) */
#define GtkEventController_val(val) ((GtkEventController*)Pointer_val(val))
#define Val_GtkEventController(obj) ((value)(obj))


CAMLprim value ml_gtk_button_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_button_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_button_new_from_icon_name(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_button_new_from_icon_name();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_button_new_with_label();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_button_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_button_new_with_mnemonic();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_button_set_use_underline(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_use_underline(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_label(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_label(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_icon_name(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_icon_name(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_has_frame(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_has_frame(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_set_child(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_button_set_child(GtkEventController_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_check_button_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_check_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_check_button_new_with_label();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_check_button_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_check_button_new_with_mnemonic();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_check_button_set_use_underline(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_use_underline(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_label(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_label(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_inconsistent(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_inconsistent(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_group(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_group(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_child(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_check_button_set_child(GtkEventController_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_entry_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_entry_new_with_buffer(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_entry_new_with_buffer();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_entry_unset_invisible_char(value self)
{
CAMLparam1(value self);
gtk_entry_unset_invisible_char(GtkEventController_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_visibility(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_visibility(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_tabs(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_tabs(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_progress_pulse_step(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_progress_pulse_step(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_entry_set_progress_fraction(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_entry_set_progress_fraction(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_image_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_image_new_from_file(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_image_new_from_file();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_image_new_from_gicon(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_image_new_from_gicon();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_image_new_from_icon_name(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_image_new_from_icon_name();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_image_new_from_paintable(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_image_new_from_paintable();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_image_new_from_pixbuf(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_image_new_from_pixbuf();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_image_new_from_resource(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_image_new_from_resource();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_image_set_pixel_size(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_pixel_size(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_icon_size(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_icon_size(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_resource(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_resource(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_pixbuf(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_pixbuf(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_image_set_from_paintable(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_image_set_from_paintable(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_label_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_label_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_label_new_with_mnemonic();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_label_set_yalign(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_yalign(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_xalign(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_xalign(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_wrap_mode(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_wrap_mode(GtkEventController_val(self), PangoWrapMode_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_wrap(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_wrap(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_label_set_width_chars(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_label_set_width_chars(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_link_button_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_link_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_link_button_new_with_label();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_link_button_set_visited(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_link_button_set_visited(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_set_uri(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_link_button_set_uri(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_link_button_get_visited(value self)
{
CAMLparam1(value self);
gboolean result = gtk_link_button_get_visited(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_link_button_get_uri(value self)
{
CAMLparam1(value self);
void *result = gtk_link_button_get_uri(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_menu_button_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_menu_button_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_menu_button_set_use_underline(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_use_underline(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_primary(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_primary(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_popover(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_popover(GtkEventController_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_menu_model(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_menu_model(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_menu_button_set_label(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_menu_button_set_label(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_password_entry_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_password_entry_set_show_peek_icon(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_password_entry_set_show_peek_icon(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_set_extra_menu(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_password_entry_set_extra_menu(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_password_entry_get_show_peek_icon(value self)
{
CAMLparam1(value self);
gboolean result = gtk_password_entry_get_show_peek_icon(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_password_entry_get_extra_menu(value self)
{
CAMLparam1(value self);
void *result = gtk_password_entry_get_extra_menu(GtkEventController_val(self));
CAMLreturn((value)result);
}

CAMLprim value ml_gtk_search_entry_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_search_entry_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_search_entry_set_search_delay(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_search_delay(GtkEventController_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_placeholder_text(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_placeholder_text(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_key_capture_widget(GtkEventController_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_input_purpose(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_search_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_search_entry_set_input_hints(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_spin_button_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_spin_button_new_with_range(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_spin_button_new_with_range();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_spin_button_update(value self)
{
CAMLparam1(value self);
gtk_spin_button_update(GtkEventController_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_spin(value self, value arg1, value arg2)
{
CAMLparam3(value self, value arg1, value arg2);
gtk_spin_button_spin(GtkEventController_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_wrap(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_wrap(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_value(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_value(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_spin_button_set_update_policy(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_spin_button_set_update_policy(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_switch_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_switch_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_switch_set_state(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_switch_set_state(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_switch_set_active(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_switch_set_active(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_switch_get_state(value self)
{
CAMLparam1(value self);
gboolean result = gtk_switch_get_state(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_switch_get_active(value self)
{
CAMLparam1(value self);
gboolean result = gtk_switch_get_active(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_toggle_button_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_toggle_button_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_toggle_button_new_with_label(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_toggle_button_new_with_label();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_toggle_button_new_with_mnemonic(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_toggle_button_new_with_mnemonic();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLprim value ml_gtk_toggle_button_toggled(value self)
{
CAMLparam1(value self);
gtk_toggle_button_toggled(GtkEventController_val(self));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_set_group(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_toggle_button_set_group(GtkEventController_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_set_active(value self, value arg1)
{
CAMLparam2(value self, value arg1);
gtk_toggle_button_set_active(GtkEventController_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_get_active(value self)
{
CAMLparam1(value self);
gboolean result = gtk_toggle_button_get_active(GtkEventController_val(self));
CAMLreturn(Val_bool(result));
}
