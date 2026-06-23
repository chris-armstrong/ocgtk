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

(* High-level class for LogAttr *)
class log_attr (obj : Log_attr.t) : log_attr_t =
  object (self)
    method get_is_line_break : int = Log_attr.get_is_line_break obj

    method set_is_line_break : int -> unit =
      fun v -> Log_attr.set_is_line_break obj v

    method get_is_mandatory_break : int = Log_attr.get_is_mandatory_break obj

    method set_is_mandatory_break : int -> unit =
      fun v -> Log_attr.set_is_mandatory_break obj v

    method get_is_char_break : int = Log_attr.get_is_char_break obj

    method set_is_char_break : int -> unit =
      fun v -> Log_attr.set_is_char_break obj v

    method get_is_white : int = Log_attr.get_is_white obj
    method set_is_white : int -> unit = fun v -> Log_attr.set_is_white obj v
    method get_is_cursor_position : int = Log_attr.get_is_cursor_position obj

    method set_is_cursor_position : int -> unit =
      fun v -> Log_attr.set_is_cursor_position obj v

    method get_is_word_start : int = Log_attr.get_is_word_start obj

    method set_is_word_start : int -> unit =
      fun v -> Log_attr.set_is_word_start obj v

    method get_is_word_end : int = Log_attr.get_is_word_end obj

    method set_is_word_end : int -> unit =
      fun v -> Log_attr.set_is_word_end obj v

    method get_is_sentence_boundary : int =
      Log_attr.get_is_sentence_boundary obj

    method set_is_sentence_boundary : int -> unit =
      fun v -> Log_attr.set_is_sentence_boundary obj v

    method get_is_sentence_start : int = Log_attr.get_is_sentence_start obj

    method set_is_sentence_start : int -> unit =
      fun v -> Log_attr.set_is_sentence_start obj v

    method get_is_sentence_end : int = Log_attr.get_is_sentence_end obj

    method set_is_sentence_end : int -> unit =
      fun v -> Log_attr.set_is_sentence_end obj v

    method get_backspace_deletes_character : int =
      Log_attr.get_backspace_deletes_character obj

    method set_backspace_deletes_character : int -> unit =
      fun v -> Log_attr.set_backspace_deletes_character obj v

    method get_is_expandable_space : int = Log_attr.get_is_expandable_space obj

    method set_is_expandable_space : int -> unit =
      fun v -> Log_attr.set_is_expandable_space obj v

    method get_is_word_boundary : int = Log_attr.get_is_word_boundary obj

    method set_is_word_boundary : int -> unit =
      fun v -> Log_attr.set_is_word_boundary obj v

    method get_break_inserts_hyphen : int =
      Log_attr.get_break_inserts_hyphen obj

    method set_break_inserts_hyphen : int -> unit =
      fun v -> Log_attr.set_break_inserts_hyphen obj v

    method get_break_removes_preceding : int =
      Log_attr.get_break_removes_preceding obj

    method set_break_removes_preceding : int -> unit =
      fun v -> Log_attr.set_break_removes_preceding obj v

    method get_reserved : int = Log_attr.get_reserved obj
    method set_reserved : int -> unit = fun v -> Log_attr.set_reserved obj v
    method as_log_attr = obj
  end

let make (is_line_break : int) (is_mandatory_break : int) (is_char_break : int)
    (is_white : int) (is_cursor_position : int) (is_word_start : int)
    (is_word_end : int) (is_sentence_boundary : int) (is_sentence_start : int)
    (is_sentence_end : int) (backspace_deletes_character : int)
    (is_expandable_space : int) (is_word_boundary : int)
    (break_inserts_hyphen : int) (break_removes_preceding : int)
    (reserved : int) : log_attr_t =
  new log_attr
    (Log_attr.make is_line_break is_mandatory_break is_char_break is_white
       is_cursor_position is_word_start is_word_end is_sentence_boundary
       is_sentence_start is_sentence_end backspace_deletes_character
       is_expandable_space is_word_boundary break_inserts_hyphen
       break_removes_preceding reserved)
