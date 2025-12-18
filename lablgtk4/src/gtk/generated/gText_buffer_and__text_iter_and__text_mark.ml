(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

(* Signal class defined in gtext_buffer_signals.ml *)

class text_buffer (obj : Text_buffer_and__text_iter_and__text_mark.Text_buffer.t) = object (self)
  inherit Gtext_buffer_signals.text_buffer_signals obj

  method can_redo = Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_can_redo obj

  method can_undo = Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_can_undo obj

  method cursor_position = Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_cursor_position obj

  method enable_undo = Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_enable_undo obj
  method set_enable_undo v = Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_enable_undo obj v

  method has_selection = Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_has_selection obj

  method text = Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_text obj
  method set_text v = Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_text obj v

  method add_mark : 'p1. (<as_text_mark: Text_buffer_and__text_iter_and__text_mark.Text_mark.t; ..> as 'p1) -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun mark where -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.add_mark obj ( mark#as_text_mark ) where)

  method apply_tag : 'p1. (#GText_tag.text_tag as 'p1) -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun tag start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.apply_tag obj ( tag#as_text_tag ) start end_)

  method apply_tag_by_name : string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun name start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.apply_tag_by_name obj name start end_)

  method backspace : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> bool -> bool = fun iter interactive default_editable -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.backspace obj iter interactive default_editable)

  method begin_irreversible_action : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.begin_irreversible_action obj )

  method begin_user_action : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.begin_user_action obj )

  method create_child_anchor : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> GText_child_anchor.text_child_anchor = fun iter -> new  GText_child_anchor.text_child_anchor(Text_buffer_and__text_iter_and__text_mark.Text_buffer.create_child_anchor obj iter)

  method create_mark : string option -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> text_mark = fun mark_name where left_gravity -> new  text_mark(Text_buffer_and__text_iter_and__text_mark.Text_buffer.create_mark obj mark_name where left_gravity)

  method delete : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete obj start end_)

  method delete_interactive : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> bool = fun start_iter end_iter default_editable -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete_interactive obj start_iter end_iter default_editable)

  method delete_mark : 'p1. (<as_text_mark: Text_buffer_and__text_iter_and__text_mark.Text_mark.t; ..> as 'p1) -> unit = fun mark -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete_mark obj ( mark#as_text_mark ))

  method delete_mark_by_name : string -> unit = fun name -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete_mark_by_name obj name)

  method delete_selection : bool -> bool -> bool = fun interactive default_editable -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete_selection obj interactive default_editable)

  method end_irreversible_action : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.end_irreversible_action obj )

  method end_user_action : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.end_user_action obj )

  method get_char_count : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_char_count obj )

  method get_insert : unit -> text_mark = fun () -> new  text_mark(Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_insert obj )

  method get_line_count : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_line_count obj )

  method get_mark : string -> text_mark option = fun name -> Option.map (fun ret -> new text_mark ret) (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_mark obj name)

  method get_max_undo_levels : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_max_undo_levels obj )

  method get_modified : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_modified obj )

  method get_selection_bound : unit -> text_mark = fun () -> new  text_mark(Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_selection_bound obj )

  method get_tag_table : unit -> GText_tag_table.text_tag_table = fun () -> new  GText_tag_table.text_tag_table(Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_tag_table obj )

  method insert : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string -> int -> unit = fun iter text len -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert obj iter text len)

  method insert_at_cursor : string -> int -> unit = fun text len -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_at_cursor obj text len)

  method insert_child_anchor : 'p1. Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> (#GText_child_anchor.text_child_anchor as 'p1) -> unit = fun iter anchor -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_child_anchor obj iter ( anchor#as_text_child_anchor ))

  method insert_interactive : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string -> int -> bool -> bool = fun iter text len default_editable -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_interactive obj iter text len default_editable)

  method insert_interactive_at_cursor : string -> int -> bool -> bool = fun text len default_editable -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_interactive_at_cursor obj text len default_editable)

  method insert_markup : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string -> int -> unit = fun iter markup len -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_markup obj iter markup len)

  method insert_range : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun iter start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_range obj iter start end_)

  method insert_range_interactive : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool -> bool = fun iter start end_ default_editable -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_range_interactive obj iter start end_ default_editable)

  method move_mark : 'p1. (<as_text_mark: Text_buffer_and__text_iter_and__text_mark.Text_mark.t; ..> as 'p1) -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun mark where -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.move_mark obj ( mark#as_text_mark ) where)

  method move_mark_by_name : string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun name where -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.move_mark_by_name obj name where)

  method place_cursor : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun where -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.place_cursor obj where)

  method redo : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.redo obj )

  method remove_all_tags : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.remove_all_tags obj start end_)

  method remove_tag : 'p1. (#GText_tag.text_tag as 'p1) -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun tag start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.remove_tag obj ( tag#as_text_tag ) start end_)

  method remove_tag_by_name : string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun name start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.remove_tag_by_name obj name start end_)

  method select_range : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun ins bound -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.select_range obj ins bound)

  method set_max_undo_levels : int -> unit = fun max_undo_levels -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_max_undo_levels obj max_undo_levels)

  method set_modified : bool -> unit = fun setting -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_modified obj setting)

  method undo : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_buffer.undo obj )

    method as_text_buffer = obj
end

and text_iter (obj : Text_buffer_and__text_iter_and__text_mark.Text_iter.t) = object (self)

  method assign : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun other -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.assign obj other)

  method backward_char : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_char obj )

  method backward_chars : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_chars obj count)

  method backward_cursor_position : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_cursor_position obj )

  method backward_cursor_positions : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_cursor_positions obj count)

  method backward_line : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_line obj )

  method backward_lines : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_lines obj count)

  method backward_sentence_start : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_sentence_start obj )

  method backward_sentence_starts : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_sentence_starts obj count)

  method backward_to_tag_toggle : 'p1. (#GText_tag.text_tag as 'p1) option -> bool = fun tag -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_to_tag_toggle obj ( tag |> Option.map (fun x -> x#as_text_tag) ))

  method backward_visible_cursor_position : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_visible_cursor_position obj )

  method backward_visible_cursor_positions : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_visible_cursor_positions obj count)

  method backward_visible_line : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_visible_line obj )

  method backward_visible_lines : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_visible_lines obj count)

  method backward_visible_word_start : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_visible_word_start obj )

  method backward_visible_word_starts : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_visible_word_starts obj count)

  method backward_word_start : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_word_start obj )

  method backward_word_starts : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_word_starts obj count)

  method can_insert : bool -> bool = fun default_editability -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.can_insert obj default_editability)

  method compare : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> int = fun rhs -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.compare obj rhs)

  method copy : unit -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.copy obj )

  method editable : bool -> bool = fun default_setting -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.editable obj default_setting)

  method ends_line : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_line obj )

  method ends_sentence : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_sentence obj )

  method ends_tag : 'p1. (#GText_tag.text_tag as 'p1) option -> bool = fun tag -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_tag obj ( tag |> Option.map (fun x -> x#as_text_tag) ))

  method ends_word : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_word obj )

  method equal : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool = fun rhs -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.equal obj rhs)

  method forward_char : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_char obj )

  method forward_chars : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_chars obj count)

  method forward_cursor_position : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_cursor_position obj )

  method forward_cursor_positions : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_cursor_positions obj count)

  method forward_line : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_line obj )

  method forward_lines : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_lines obj count)

  method forward_sentence_end : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_sentence_end obj )

  method forward_sentence_ends : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_sentence_ends obj count)

  method forward_to_end : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_to_end obj )

  method forward_to_line_end : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_to_line_end obj )

  method forward_to_tag_toggle : 'p1. (#GText_tag.text_tag as 'p1) option -> bool = fun tag -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_to_tag_toggle obj ( tag |> Option.map (fun x -> x#as_text_tag) ))

  method forward_visible_cursor_position : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_visible_cursor_position obj )

  method forward_visible_cursor_positions : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_visible_cursor_positions obj count)

  method forward_visible_line : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_visible_line obj )

  method forward_visible_lines : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_visible_lines obj count)

  method forward_visible_word_end : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_visible_word_end obj )

  method forward_visible_word_ends : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_visible_word_ends obj count)

  method forward_word_end : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_word_end obj )

  method forward_word_ends : int -> bool = fun count -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_word_ends obj count)

  method free : unit -> unit = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.free obj )

  method get_buffer : unit -> text_buffer = fun () -> new  text_buffer(Text_buffer_and__text_iter_and__text_mark.Text_iter.get_buffer obj )

  method get_bytes_in_line : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_bytes_in_line obj )

  method get_chars_in_line : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_chars_in_line obj )

  method get_child_anchor : unit -> GText_child_anchor.text_child_anchor option = fun () -> Option.map (fun ret -> new GText_child_anchor.text_child_anchor ret) (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_child_anchor obj )

  method get_line : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_line obj )

  method get_line_index : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_line_index obj )

  method get_line_offset : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_line_offset obj )

  method get_offset : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_offset obj )

  method get_visible_line_index : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_visible_line_index obj )

  method get_visible_line_offset : unit -> int = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_visible_line_offset obj )

  method has_tag : 'p1. (#GText_tag.text_tag as 'p1) -> bool = fun tag -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.has_tag obj ( tag#as_text_tag ))

  method in_range : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool = fun start end_ -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.in_range obj start end_)

  method inside_sentence : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.inside_sentence obj )

  method inside_word : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.inside_word obj )

  method is_cursor_position : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.is_cursor_position obj )

  method is_end : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.is_end obj )

  method is_start : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.is_start obj )

  method order : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit = fun second -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.order obj second)

  method set_line : int -> unit = fun line_number -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.set_line obj line_number)

  method set_line_index : int -> unit = fun byte_on_line -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.set_line_index obj byte_on_line)

  method set_line_offset : int -> unit = fun char_on_line -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.set_line_offset obj char_on_line)

  method set_offset : int -> unit = fun char_offset -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.set_offset obj char_offset)

  method set_visible_line_index : int -> unit = fun byte_on_line -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.set_visible_line_index obj byte_on_line)

  method set_visible_line_offset : int -> unit = fun char_on_line -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.set_visible_line_offset obj char_on_line)

  method starts_line : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_line obj )

  method starts_sentence : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_sentence obj )

  method starts_tag : 'p1. (#GText_tag.text_tag as 'p1) option -> bool = fun tag -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_tag obj ( tag |> Option.map (fun x -> x#as_text_tag) ))

  method starts_word : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_word obj )

  method toggles_tag : 'p1. (#GText_tag.text_tag as 'p1) option -> bool = fun tag -> (Text_buffer_and__text_iter_and__text_mark.Text_iter.toggles_tag obj ( tag |> Option.map (fun x -> x#as_text_tag) ))

    method as_text_iter = obj
end

and text_mark (obj : Text_buffer_and__text_iter_and__text_mark.Text_mark.t) = object (self)

  method left_gravity = Text_buffer_and__text_iter_and__text_mark.Text_mark.get_left_gravity obj

  method name = Text_buffer_and__text_iter_and__text_mark.Text_mark.get_name obj

  method get_buffer : unit -> text_buffer option = fun () -> Option.map (fun ret -> new text_buffer ret) (Text_buffer_and__text_iter_and__text_mark.Text_mark.get_buffer obj )

  method get_deleted : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_mark.get_deleted obj )

  method get_visible : unit -> bool = fun () -> (Text_buffer_and__text_iter_and__text_mark.Text_mark.get_visible obj )

  method set_visible : bool -> unit = fun setting -> (Text_buffer_and__text_iter_and__text_mark.Text_mark.set_visible obj setting)

    method as_text_mark = obj
end
