/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Settings */

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

/* Type-specific conversion macros for GtkSettings */
#define GtkSettings_val(val) ((GtkSettings*)ext_of_val(val))
#define Val_GtkSettings(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_settings_reset_property(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_settings_reset_property(GtkSettings_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_alternative_button_order(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-alternative-button-order", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_alternative_button_order(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-alternative-button-order", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_alternative_sort_arrows(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-alternative-sort-arrows", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_alternative_sort_arrows(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-alternative-sort-arrows", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_application_prefer_dark_theme(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-application-prefer-dark-theme", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_application_prefer_dark_theme(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-application-prefer-dark-theme", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_cursor_aspect_ratio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "gtk-cursor-aspect-ratio", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_cursor_aspect_ratio(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-cursor-aspect-ratio", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_cursor_blink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-cursor-blink", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_cursor_blink(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-cursor-blink", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_cursor_blink_time(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-cursor-blink-time", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_cursor_blink_time(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-cursor-blink-time", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_cursor_blink_timeout(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-cursor-blink-timeout", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_cursor_blink_timeout(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-cursor-blink-timeout", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_cursor_theme_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-cursor-theme-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_cursor_theme_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-cursor-theme-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_cursor_theme_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-cursor-theme-size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_cursor_theme_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-cursor-theme-size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_decoration_layout(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-decoration-layout", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_decoration_layout(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-decoration-layout", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_dialogs_use_header(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-dialogs-use-header", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_dialogs_use_header(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-dialogs-use-header", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_dnd_drag_threshold(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-dnd-drag-threshold", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_dnd_drag_threshold(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-dnd-drag-threshold", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_double_click_distance(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-double-click-distance", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_double_click_distance(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-double-click-distance", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_double_click_time(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-double-click-time", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_double_click_time(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-double-click-time", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_enable_accels(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-enable-accels", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_enable_accels(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-enable-accels", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_enable_animations(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-enable-animations", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_enable_animations(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-enable-animations", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_enable_event_sounds(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-enable-event-sounds", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_enable_event_sounds(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-enable-event-sounds", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_enable_input_feedback_sounds(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-enable-input-feedback-sounds", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_enable_input_feedback_sounds(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-enable-input-feedback-sounds", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_enable_primary_paste(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-enable-primary-paste", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_enable_primary_paste(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-enable-primary-paste", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_entry_password_hint_timeout(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "gtk-entry-password-hint-timeout", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_entry_password_hint_timeout(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-entry-password-hint-timeout", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_entry_select_on_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-entry-select-on-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_entry_select_on_focus(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-entry-select-on-focus", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_error_bell(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-error-bell", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_error_bell(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-error-bell", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_font_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-font-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_font_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-font-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_fontconfig_timestamp(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "gtk-fontconfig-timestamp", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_fontconfig_timestamp(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-fontconfig-timestamp", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_hint_font_metrics(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-hint-font-metrics", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_hint_font_metrics(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-hint-font-metrics", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_icon_theme_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-icon-theme-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_icon_theme_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-icon-theme-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_im_module(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-im-module", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_im_module(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-im-module", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_keynav_use_caret(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-keynav-use-caret", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_keynav_use_caret(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-keynav-use-caret", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_label_select_on_focus(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-label-select-on-focus", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_label_select_on_focus(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-label-select-on-focus", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_long_press_time(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "gtk-long-press-time", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_long_press_time(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-long-press-time", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_overlay_scrolling(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-overlay-scrolling", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_overlay_scrolling(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-overlay-scrolling", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_primary_button_warps_slider(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-primary-button-warps-slider", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_primary_button_warps_slider(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-primary-button-warps-slider", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_print_backends(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-print-backends", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_print_backends(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-print-backends", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_print_preview_command(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-print-preview-command", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_print_preview_command(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-print-preview-command", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_recent_files_enabled(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-recent-files-enabled", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_recent_files_enabled(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-recent-files-enabled", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_recent_files_max_age(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-recent-files-max-age", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_recent_files_max_age(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-recent-files-max-age", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_shell_shows_app_menu(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-shell-shows-app-menu", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_shell_shows_app_menu(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-shell-shows-app-menu", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_shell_shows_desktop(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-shell-shows-desktop", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_shell_shows_desktop(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-shell-shows-desktop", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_shell_shows_menubar(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-shell-shows-menubar", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_shell_shows_menubar(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-shell-shows-menubar", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_show_status_shapes(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-show-status-shapes", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_show_status_shapes(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-show-status-shapes", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_sound_theme_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-sound-theme-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_sound_theme_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-sound-theme-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_split_cursor(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "gtk-split-cursor", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_split_cursor(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-split-cursor", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_theme_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-theme-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_theme_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-theme-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_titlebar_double_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-titlebar-double-click", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_titlebar_double_click(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-titlebar-double-click", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_titlebar_middle_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-titlebar-middle-click", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_titlebar_middle_click(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-titlebar-middle-click", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_titlebar_right_click(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-titlebar-right-click", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_titlebar_right_click(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-titlebar-right-click", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_xft_antialias(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-xft-antialias", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_xft_antialias(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-xft-antialias", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_xft_dpi(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-xft-dpi", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_xft_dpi(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-xft-dpi", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_xft_hinting(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "gtk-xft-hinting", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_xft_hinting(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-xft-hinting", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_xft_hintstyle(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-xft-hintstyle", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_xft_hintstyle(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-xft-hintstyle", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_settings_get_gtk_xft_rgba(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "gtk-xft-rgba", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_settings_set_gtk_xft_rgba(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkSettings *obj = (GtkSettings *)GtkSettings_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "gtk-xft-rgba", c_value, NULL);
CAMLreturn(Val_unit);
}
