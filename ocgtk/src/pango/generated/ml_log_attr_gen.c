/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LogAttr */

#include <pango/pango.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <pango/pango.h>
/* Include library-specific type conversions and forward declarations */
#include "pango_decls.h"

/* Conversion functions for PangoLogAttr (opaque record with hidden fields) */
PangoLogAttr *PangoLogAttr_val(value v) {
  return (PangoLogAttr *)ml_gir_record_ptr_val(v, "PangoLogAttr");
}

value Val_PangoLogAttr(const PangoLogAttr *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoLogAttr_option(const PangoLogAttr *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoLogAttr(ptr));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_line_break(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_line_break));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_mandatory_break(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_mandatory_break));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_char_break(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_char_break));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_white(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_white));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_cursor_position(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_cursor_position));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_word_start(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_word_start));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_word_end(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_word_end));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_sentence_boundary(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_sentence_boundary));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_sentence_start(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_sentence_start));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_sentence_end(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_sentence_end));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_backspace_deletes_character(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->backspace_deletes_character));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_expandable_space(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_expandable_space));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_is_word_boundary(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->is_word_boundary));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_break_inserts_hyphen(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->break_inserts_hyphen));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_break_removes_preceding(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->break_removes_preceding));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_get_reserved(value self)
{
    CAMLparam1(self);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    CAMLreturn(Val_int(rec->reserved));
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_line_break(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_line_break = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_mandatory_break(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_mandatory_break = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_char_break(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_char_break = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_white(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_white = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_cursor_position(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_cursor_position = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_word_start(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_word_start = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_word_end(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_word_end = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_sentence_boundary(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_sentence_boundary = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_sentence_start(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_sentence_start = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_sentence_end(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_sentence_end = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_backspace_deletes_character(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->backspace_deletes_character = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_expandable_space(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_expandable_space = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_is_word_boundary(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->is_word_boundary = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_break_inserts_hyphen(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->break_inserts_hyphen = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_break_removes_preceding(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->break_removes_preceding = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_set_reserved(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoLogAttr *rec = PangoLogAttr_val(self);
    rec->reserved = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_log_attr_make_native(value v_is_line_break, value v_is_mandatory_break, value v_is_char_break, value v_is_white, value v_is_cursor_position, value v_is_word_start, value v_is_word_end, value v_is_sentence_boundary, value v_is_sentence_start, value v_is_sentence_end, value v_backspace_deletes_character, value v_is_expandable_space, value v_is_word_boundary, value v_break_inserts_hyphen, value v_break_removes_preceding, value v_reserved)
{
    CAMLparam5(v_is_line_break, v_is_mandatory_break, v_is_char_break, v_is_white, v_is_cursor_position);
CAMLxparam5(v_is_word_start, v_is_word_end, v_is_sentence_boundary, v_is_sentence_start, v_is_sentence_end);
CAMLxparam5(v_backspace_deletes_character, v_is_expandable_space, v_is_word_boundary, v_break_inserts_hyphen, v_break_removes_preceding);
CAMLxparam1(v_reserved);

    PangoLogAttr *obj = g_new0(PangoLogAttr, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->is_line_break = Int_val(v_is_line_break);
    obj->is_mandatory_break = Int_val(v_is_mandatory_break);
    obj->is_char_break = Int_val(v_is_char_break);
    obj->is_white = Int_val(v_is_white);
    obj->is_cursor_position = Int_val(v_is_cursor_position);
    obj->is_word_start = Int_val(v_is_word_start);
    obj->is_word_end = Int_val(v_is_word_end);
    obj->is_sentence_boundary = Int_val(v_is_sentence_boundary);
    obj->is_sentence_start = Int_val(v_is_sentence_start);
    obj->is_sentence_end = Int_val(v_is_sentence_end);
    obj->backspace_deletes_character = Int_val(v_backspace_deletes_character);
    obj->is_expandable_space = Int_val(v_is_expandable_space);
    obj->is_word_boundary = Int_val(v_is_word_boundary);
    obj->break_inserts_hyphen = Int_val(v_break_inserts_hyphen);
    obj->break_removes_preceding = Int_val(v_break_removes_preceding);
    obj->reserved = Int_val(v_reserved);
    CAMLreturn(Val_PangoLogAttr(obj));
}
\
CAMLexport CAMLprim value ml_pango_log_attr_make_bytecode(value * argv, int argn)
{
    return ml_pango_log_attr_make_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10], argv[11], argv[12], argv[13], argv[14], argv[15]);
}

