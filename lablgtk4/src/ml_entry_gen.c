/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Entry */

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

/* Type-specific conversion macros for GtkEntry */
#define GtkEntry_val(val) ((GtkEntry*)ext_of_val(val))
#define Val_GtkEntry(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_entry_new(value unit)
{
CAMLparam1(unit);
GtkEntry *obj = gtk_entry_new();
CAMLreturn(Val_GtkEntry(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkEntry *obj = gtk_entry_new_with_buffer(GtkWidget_val(arg1));
CAMLreturn(Val_GtkEntry(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_unset_invisible_char(value self)
{
CAMLparam1(self);


    gtk_entry_unset_invisible_char(GtkEntry_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_input_purpose(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_input_purpose(GtkEntry_val(self), GtkInputPurpose_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_input_hints(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_input_hints(GtkEntry_val(self), GtkInputHints_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_tooltip_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_tooltip_text(GtkEntry_val(self), GtkEntryIconPosition_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_tooltip_markup(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_tooltip_markup(GtkEntry_val(self), GtkEntryIconPosition_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_sensitive(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_sensitive(GtkEntry_val(self), GtkEntryIconPosition_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_from_icon_name(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_from_icon_name(GtkEntry_val(self), GtkEntryIconPosition_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_icon_activatable(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_entry_set_icon_activatable(GtkEntry_val(self), GtkEntryIconPosition_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_completion(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_completion(GtkEntry_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_buffer(GtkEntry_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_alignment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_entry_set_alignment(GtkEntry_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_reset_im_context(value self)
{
CAMLparam1(self);


    gtk_entry_reset_im_context(GtkEntry_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_progress_pulse(value self)
{
CAMLparam1(self);


    gtk_entry_progress_pulse(GtkEntry_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_grab_focus_without_selecting(value self)
{
CAMLparam1(self);


    gboolean result = gtk_entry_grab_focus_without_selecting(GtkEntry_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_input_purpose(value self)
{
CAMLparam1(self);


    GtkInputPurpose result = gtk_entry_get_input_purpose(GtkEntry_val(self));
CAMLreturn(Val_GtkInputPurpose(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_input_hints(value self)
{
CAMLparam1(self);


    GtkInputHints result = gtk_entry_get_input_hints(GtkEntry_val(self));
CAMLreturn(Val_GtkInputHints(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_storage_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkImageType result = gtk_entry_get_icon_storage_type(GtkEntry_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(Val_GtkImageType(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_sensitive(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_entry_get_icon_sensitive(GtkEntry_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    const char* result = gtk_entry_get_icon_name(GtkEntry_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_at_pos(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    int result = gtk_entry_get_icon_at_pos(GtkEntry_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_icon_activatable(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_entry_get_icon_activatable(GtkEntry_val(self), GtkEntryIconPosition_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_current_icon_drag_source(value self)
{
CAMLparam1(self);


    int result = gtk_entry_get_current_icon_drag_source(GtkEntry_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_completion(value self)
{
CAMLparam1(self);


    GtkEntryCompletion* result = gtk_entry_get_completion(GtkEntry_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_buffer(value self)
{
CAMLparam1(self);


    GtkEntryBuffer* result = gtk_entry_get_buffer(GtkEntry_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_alignment(value self)
{
CAMLparam1(self);


    float result = gtk_entry_get_alignment(GtkEntry_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_activates_default(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activates-default", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_activates_default(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activates-default", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_enable_emoji_completion(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-emoji-completion", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_enable_emoji_completion(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-emoji-completion", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_has_frame(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-frame", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_has_frame(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-frame", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_im_module(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "im-module", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_im_module(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "im-module", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_invisible_char(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "invisible-char", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_invisible_char(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_invisible_char_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "invisible-char-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_invisible_char_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "invisible-char-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_max_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_max_length(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-length", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_overwrite_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "overwrite-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_overwrite_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "overwrite-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "placeholder-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_placeholder_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_activatable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-sensitive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_sensitive(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-sensitive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_tooltip_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-tooltip-markup", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_tooltip_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-tooltip-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_primary_icon_tooltip_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "primary-icon-tooltip-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_primary_icon_tooltip_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "primary-icon-tooltip-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_progress_fraction(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "progress-fraction", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_progress_fraction(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "progress-fraction", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_progress_pulse_step(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "progress-pulse-step", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_progress_pulse_step(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "progress-pulse-step", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_scroll_offset(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "scroll-offset", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_activatable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_sensitive(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-sensitive", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_sensitive(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-sensitive", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_tooltip_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-tooltip-markup", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_tooltip_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-tooltip-markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_secondary_icon_tooltip_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "secondary-icon-tooltip-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_secondary_icon_tooltip_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "secondary-icon-tooltip-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_show_emoji_icon(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-emoji-icon", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_show_emoji_icon(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-emoji-icon", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_text_length(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "text-length", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_get_truncate_multiline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "truncate-multiline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_truncate_multiline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "truncate-multiline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_get_visibility(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visibility", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_entry_set_visibility(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEntry *obj = (GtkEntry *)GtkEntry_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visibility", c_value, NULL);
CAMLreturn(Val_unit);
}
