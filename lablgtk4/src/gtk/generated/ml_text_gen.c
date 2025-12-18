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
#include "ml_gobject.h"

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
