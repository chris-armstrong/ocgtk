(* GENERATED CODE - DO NOT EDIT *)
(* LogAttr: LogAttr *)

type t = [ `log_attr ] Gobject.obj
(** The `PangoLogAttr` structure stores information about the attributes of a
    single character. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_is_line_break : t -> int = "ml_pango_log_attr_get_is_line_break"

external get_is_mandatory_break : t -> int
  = "ml_pango_log_attr_get_is_mandatory_break"

external get_is_char_break : t -> int = "ml_pango_log_attr_get_is_char_break"
external get_is_white : t -> int = "ml_pango_log_attr_get_is_white"

external get_is_cursor_position : t -> int
  = "ml_pango_log_attr_get_is_cursor_position"

external get_is_word_start : t -> int = "ml_pango_log_attr_get_is_word_start"
external get_is_word_end : t -> int = "ml_pango_log_attr_get_is_word_end"

external get_is_sentence_boundary : t -> int
  = "ml_pango_log_attr_get_is_sentence_boundary"

external get_is_sentence_start : t -> int
  = "ml_pango_log_attr_get_is_sentence_start"

external get_is_sentence_end : t -> int
  = "ml_pango_log_attr_get_is_sentence_end"

external get_backspace_deletes_character : t -> int
  = "ml_pango_log_attr_get_backspace_deletes_character"

external get_is_expandable_space : t -> int
  = "ml_pango_log_attr_get_is_expandable_space"

external get_is_word_boundary : t -> int
  = "ml_pango_log_attr_get_is_word_boundary"

external get_break_inserts_hyphen : t -> int
  = "ml_pango_log_attr_get_break_inserts_hyphen"

external get_break_removes_preceding : t -> int
  = "ml_pango_log_attr_get_break_removes_preceding"

external get_reserved : t -> int = "ml_pango_log_attr_get_reserved"

(* Setters *)
external set_is_line_break : t -> int -> unit
  = "ml_pango_log_attr_set_is_line_break"

external set_is_mandatory_break : t -> int -> unit
  = "ml_pango_log_attr_set_is_mandatory_break"

external set_is_char_break : t -> int -> unit
  = "ml_pango_log_attr_set_is_char_break"

external set_is_white : t -> int -> unit = "ml_pango_log_attr_set_is_white"

external set_is_cursor_position : t -> int -> unit
  = "ml_pango_log_attr_set_is_cursor_position"

external set_is_word_start : t -> int -> unit
  = "ml_pango_log_attr_set_is_word_start"

external set_is_word_end : t -> int -> unit
  = "ml_pango_log_attr_set_is_word_end"

external set_is_sentence_boundary : t -> int -> unit
  = "ml_pango_log_attr_set_is_sentence_boundary"

external set_is_sentence_start : t -> int -> unit
  = "ml_pango_log_attr_set_is_sentence_start"

external set_is_sentence_end : t -> int -> unit
  = "ml_pango_log_attr_set_is_sentence_end"

external set_backspace_deletes_character : t -> int -> unit
  = "ml_pango_log_attr_set_backspace_deletes_character"

external set_is_expandable_space : t -> int -> unit
  = "ml_pango_log_attr_set_is_expandable_space"

external set_is_word_boundary : t -> int -> unit
  = "ml_pango_log_attr_set_is_word_boundary"

external set_break_inserts_hyphen : t -> int -> unit
  = "ml_pango_log_attr_set_break_inserts_hyphen"

external set_break_removes_preceding : t -> int -> unit
  = "ml_pango_log_attr_set_break_removes_preceding"

external set_reserved : t -> int -> unit = "ml_pango_log_attr_set_reserved"

external make :
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  t = "ml_pango_log_attr_make_bytecode" "ml_pango_log_attr_make_native"
