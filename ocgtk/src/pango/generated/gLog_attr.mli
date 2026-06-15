class type log_attr_t = object
  method get_is_line_break : int
  method set_is_line_break : int -> unit
  method get_is_mandatory_break : int
  method set_is_mandatory_break : int -> unit
  method get_is_char_break : int
  method set_is_char_break : int -> unit
  method get_is_white : int
  method set_is_white : int -> unit
  method get_is_cursor_position : int
  method set_is_cursor_position : int -> unit
  method get_is_word_start : int
  method set_is_word_start : int -> unit
  method get_is_word_end : int
  method set_is_word_end : int -> unit
  method get_is_sentence_boundary : int
  method set_is_sentence_boundary : int -> unit
  method get_is_sentence_start : int
  method set_is_sentence_start : int -> unit
  method get_is_sentence_end : int
  method set_is_sentence_end : int -> unit
  method get_backspace_deletes_character : int
  method set_backspace_deletes_character : int -> unit
  method get_is_expandable_space : int
  method set_is_expandable_space : int -> unit
  method get_is_word_boundary : int
  method set_is_word_boundary : int -> unit
  method get_break_inserts_hyphen : int
  method set_break_inserts_hyphen : int -> unit
  method get_break_removes_preceding : int
  method set_break_removes_preceding : int -> unit
  method get_reserved : int
  method set_reserved : int -> unit
  method as_log_attr : Log_attr.t
end

class log_attr : Log_attr.t -> log_attr_t

val make :
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
  log_attr_t
