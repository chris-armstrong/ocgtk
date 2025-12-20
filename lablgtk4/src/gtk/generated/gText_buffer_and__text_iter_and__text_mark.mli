class text_buffer : Text_buffer_and__text_iter_and__text_mark.Text_buffer.t ->
  object
    inherit Gtext_buffer_signals.text_buffer_signals
    method add_mark : <as_text_mark: Text_buffer_and__text_iter_and__text_mark.Text_mark.t; ..> -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method apply_tag : #GText_tag.text_tag -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method apply_tag_by_name : string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method backspace : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> bool -> bool
    method begin_irreversible_action : unit -> unit
    method begin_user_action : unit -> unit
    method create_child_anchor : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> GText_child_anchor.text_child_anchor
    method create_mark : string option -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> text_mark
    method delete : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method delete_interactive : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> bool
    method delete_mark : <as_text_mark: Text_buffer_and__text_iter_and__text_mark.Text_mark.t; ..> -> unit
    method delete_mark_by_name : string -> unit
    method delete_selection : bool -> bool -> bool
    method end_irreversible_action : unit -> unit
    method end_user_action : unit -> unit
    method get_can_redo : unit -> bool
    method get_can_undo : unit -> bool
    method get_char_count : unit -> int
    method get_enable_undo : unit -> bool
    method get_has_selection : unit -> bool
    method get_insert : unit -> text_mark
    method get_line_count : unit -> int
    method get_mark : string -> text_mark option
    method get_max_undo_levels : unit -> int
    method get_modified : unit -> bool
    method get_selection_bound : unit -> text_mark
    method get_slice : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> string
    method get_tag_table : unit -> GText_tag_table.text_tag_table
    method get_text : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> string
    method insert : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string -> int -> unit
    method insert_at_cursor : string -> int -> unit
    method insert_child_anchor : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> #GText_child_anchor.text_child_anchor -> unit
    method insert_interactive : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string -> int -> bool -> bool
    method insert_interactive_at_cursor : string -> int -> bool -> bool
    method insert_markup : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string -> int -> unit
    method insert_range : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method insert_range_interactive : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> bool
    method move_mark : <as_text_mark: Text_buffer_and__text_iter_and__text_mark.Text_mark.t; ..> -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method move_mark_by_name : string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method place_cursor : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method redo : unit -> unit
    method remove_all_tags : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method remove_tag : #GText_tag.text_tag -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method remove_tag_by_name : string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method select_range : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method set_enable_undo : bool -> unit
    method set_max_undo_levels : int -> unit
    method set_modified : bool -> unit
    method set_text : string -> int -> unit
    method undo : unit -> unit
    method cursor_position : int
    method as_text_buffer : Text_buffer_and__text_iter_and__text_mark.Text_buffer.t
  end

and text_iter : Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
  object
    method assign : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method backward_char : unit -> bool
    method backward_chars : int -> bool
    method backward_cursor_position : unit -> bool
    method backward_cursor_positions : int -> bool
    method backward_line : unit -> bool
    method backward_lines : int -> bool
    method backward_sentence_start : unit -> bool
    method backward_sentence_starts : int -> bool
    method backward_to_tag_toggle : #GText_tag.text_tag option -> bool
    method backward_visible_cursor_position : unit -> bool
    method backward_visible_cursor_positions : int -> bool
    method backward_visible_line : unit -> bool
    method backward_visible_lines : int -> bool
    method backward_visible_word_start : unit -> bool
    method backward_visible_word_starts : int -> bool
    method backward_word_start : unit -> bool
    method backward_word_starts : int -> bool
    method can_insert : bool -> bool
    method compare : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> int
    method copy : unit -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t
    method editable : bool -> bool
    method ends_line : unit -> bool
    method ends_sentence : unit -> bool
    method ends_tag : #GText_tag.text_tag option -> bool
    method ends_word : unit -> bool
    method equal : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
    method forward_char : unit -> bool
    method forward_chars : int -> bool
    method forward_cursor_position : unit -> bool
    method forward_cursor_positions : int -> bool
    method forward_line : unit -> bool
    method forward_lines : int -> bool
    method forward_sentence_end : unit -> bool
    method forward_sentence_ends : int -> bool
    method forward_to_end : unit -> unit
    method forward_to_line_end : unit -> bool
    method forward_to_tag_toggle : #GText_tag.text_tag option -> bool
    method forward_visible_cursor_position : unit -> bool
    method forward_visible_cursor_positions : int -> bool
    method forward_visible_line : unit -> bool
    method forward_visible_lines : int -> bool
    method forward_visible_word_end : unit -> bool
    method forward_visible_word_ends : int -> bool
    method forward_word_end : unit -> bool
    method forward_word_ends : int -> bool
    method free : unit -> unit
    method get_buffer : unit -> text_buffer
    method get_bytes_in_line : unit -> int
    method get_chars_in_line : unit -> int
    method get_child_anchor : unit -> GText_child_anchor.text_child_anchor option
    method get_line : unit -> int
    method get_line_index : unit -> int
    method get_line_offset : unit -> int
    method get_offset : unit -> int
    method get_slice : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string
    method get_text : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string
    method get_visible_line_index : unit -> int
    method get_visible_line_offset : unit -> int
    method get_visible_slice : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string
    method get_visible_text : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string
    method has_tag : #GText_tag.text_tag -> bool
    method in_range : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
    method inside_sentence : unit -> bool
    method inside_word : unit -> bool
    method is_cursor_position : unit -> bool
    method is_end : unit -> bool
    method is_start : unit -> bool
    method order : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
    method set_line : int -> unit
    method set_line_index : int -> unit
    method set_line_offset : int -> unit
    method set_offset : int -> unit
    method set_visible_line_index : int -> unit
    method set_visible_line_offset : int -> unit
    method starts_line : unit -> bool
    method starts_sentence : unit -> bool
    method starts_tag : #GText_tag.text_tag option -> bool
    method starts_word : unit -> bool
    method toggles_tag : #GText_tag.text_tag option -> bool
    method as_text_iter : Text_buffer_and__text_iter_and__text_mark.Text_iter.t
  end

and text_mark : Text_buffer_and__text_iter_and__text_mark.Text_mark.t ->
  object
    method get_buffer : unit -> text_buffer option
    method get_deleted : unit -> bool
    method get_left_gravity : unit -> bool
    method get_name : unit -> string option
    method get_visible : unit -> bool
    method set_visible : bool -> unit
    method as_text_mark : Text_buffer_and__text_iter_and__text_mark.Text_mark.t
  end
