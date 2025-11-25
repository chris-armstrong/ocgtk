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
#ifndef Val_GtkEntry
#define GtkEntry_val(val) ((GtkEntry*)ext_of_val(val))
#define Val_GtkEntry(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEntry */


CAMLexport CAMLprim value ml_gtk_entry_new(value unit)
{
CAMLparam1(unit);
GtkEntry *obj = gtk_entry_new();
CAMLreturn(Val_GtkEntry(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_new_with_buffer(value arg1)
{
CAMLparam1(arg1);
GtkEntry *obj = gtk_entry_new_with_buffer(GtkEntryBuffer_val(arg1));
CAMLreturn(Val_GtkEntry(obj));
}

CAMLexport CAMLprim value ml_gtk_entry_unset_invisible_char(value self)
{
CAMLparam1(self);

gtk_entry_unset_invisible_char(GtkEntry_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_visibility(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_visibility(GtkEntry_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_progress_pulse_step(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_progress_pulse_step(GtkEntry_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_progress_fraction(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_progress_fraction(GtkEntry_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_placeholder_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_placeholder_text(GtkEntry_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_overwrite_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_overwrite_mode(GtkEntry_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_max_length(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_max_length(GtkEntry_val(self), Int_val(arg1));
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

CAMLexport CAMLprim value ml_gtk_entry_set_has_frame(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_has_frame(GtkEntry_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_completion(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_completion(GtkEntry_val(self), (Is_some(arg1) ? GtkEntryCompletion_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_buffer(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_buffer(GtkEntry_val(self), GtkEntryBuffer_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_alignment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_alignment(GtkEntry_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_entry_set_activates_default(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_entry_set_activates_default(GtkEntry_val(self), Bool_val(arg1));
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

CAMLexport CAMLprim value ml_gtk_entry_get_visibility(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_get_visibility(GtkEntry_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_progress_pulse_step(value self)
{
CAMLparam1(self);

double result = gtk_entry_get_progress_pulse_step(GtkEntry_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_progress_fraction(value self)
{
CAMLparam1(self);

double result = gtk_entry_get_progress_fraction(GtkEntry_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_placeholder_text(value self)
{
CAMLparam1(self);

const char* result = gtk_entry_get_placeholder_text(GtkEntry_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_overwrite_mode(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_get_overwrite_mode(GtkEntry_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_max_length(value self)
{
CAMLparam1(self);

int result = gtk_entry_get_max_length(GtkEntry_val(self));
CAMLreturn(Val_int(result));
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

CAMLexport CAMLprim value ml_gtk_entry_get_has_frame(value self)
{
CAMLparam1(self);

gboolean result = gtk_entry_get_has_frame(GtkEntry_val(self));
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
CAMLreturn(Val_GtkEntryCompletion(result));
}

CAMLexport CAMLprim value ml_gtk_entry_get_buffer(value self)
{
CAMLparam1(self);

GtkEntryBuffer* result = gtk_entry_get_buffer(GtkEntry_val(self));
CAMLreturn(Val_GtkEntryBuffer(result));
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

gboolean result = gtk_entry_get_activates_default(GtkEntry_val(self));
CAMLreturn(Val_bool(result));
}
