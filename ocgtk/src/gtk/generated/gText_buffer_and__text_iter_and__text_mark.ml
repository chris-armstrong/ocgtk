(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type text_buffer_t = object
  method on_begin_user_action :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_changed : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_end_user_action :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_modified_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_redo : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_undo : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method add_mark :
    text_mark_t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit

  method add_selection_clipboard : Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> unit

  method apply_tag :
    GText_tag.text_tag_t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method apply_tag_by_name :
    string ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method backspace :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    bool ->
    bool ->
    bool

  method begin_irreversible_action : unit -> unit
  method begin_user_action : unit -> unit
  method copy_clipboard : Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> unit

  method create_child_anchor :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    GText_child_anchor.text_child_anchor_t

  method create_mark :
    string option ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    bool ->
    text_mark_t

  method cut_clipboard : Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> bool -> unit

  method delete :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method delete_interactive :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    bool ->
    bool

  method delete_mark : text_mark_t -> unit
  method delete_mark_by_name : string -> unit
  method delete_selection : bool -> bool -> bool
  method end_irreversible_action : unit -> unit
  method end_user_action : unit -> unit
  method get_can_redo : unit -> bool
  method get_can_undo : unit -> bool
  method get_char_count : unit -> int
  method get_enable_undo : unit -> bool
  method get_has_selection : unit -> bool
  method get_insert : unit -> text_mark_t
  method get_line_count : unit -> int
  method get_mark : string -> text_mark_t option
  method get_max_undo_levels : unit -> int
  method get_modified : unit -> bool
  method get_selection_bound : unit -> text_mark_t

  method get_selection_content :
    unit -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t

  method get_slice :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    bool ->
    string

  method get_tag_table : unit -> GText_tag_table.text_tag_table_t

  method get_text :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    bool ->
    string

  method insert :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    string ->
    int ->
    unit

  method insert_at_cursor : string -> int -> unit

  method insert_child_anchor :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    GText_child_anchor.text_child_anchor_t ->
    unit

  method insert_interactive :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    string ->
    int ->
    bool ->
    bool

  method insert_interactive_at_cursor : string -> int -> bool -> bool

  method insert_markup :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    string ->
    int ->
    unit

  method insert_paintable :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Ocgtk_gdk.Gdk.Paintable.paintable_t ->
    unit

  method insert_range :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method insert_range_interactive :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    bool ->
    bool

  method move_mark :
    text_mark_t -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit

  method move_mark_by_name :
    string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit

  method paste_clipboard :
    Ocgtk_gdk.Gdk.Clipboard.clipboard_t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t option ->
    bool ->
    unit

  method place_cursor :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit

  method redo : unit -> unit

  method remove_all_tags :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method remove_selection_clipboard :
    Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> unit

  method remove_tag :
    GText_tag.text_tag_t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method remove_tag_by_name :
    string ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method select_range :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    unit

  method set_enable_undo : bool -> unit
  method set_max_undo_levels : int -> unit
  method set_modified : bool -> unit
  method set_text : string -> int -> unit
  method undo : unit -> unit
  method cursor_position : int

  method as_text_buffer :
    Text_buffer_and__text_iter_and__text_mark.Text_buffer.t
end

and text_iter_t = object
  method assign : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
  method backward_char : unit -> bool
  method backward_chars : int -> bool
  method backward_cursor_position : unit -> bool
  method backward_cursor_positions : int -> bool
  method backward_line : unit -> bool
  method backward_lines : int -> bool
  method backward_sentence_start : unit -> bool
  method backward_sentence_starts : int -> bool
  method backward_to_tag_toggle : GText_tag.text_tag_t option -> bool
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
  method editable : bool -> bool
  method ends_line : unit -> bool
  method ends_sentence : unit -> bool
  method ends_tag : GText_tag.text_tag_t option -> bool
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
  method forward_to_tag_toggle : GText_tag.text_tag_t option -> bool
  method forward_visible_cursor_position : unit -> bool
  method forward_visible_cursor_positions : int -> bool
  method forward_visible_line : unit -> bool
  method forward_visible_lines : int -> bool
  method forward_visible_word_end : unit -> bool
  method forward_visible_word_ends : int -> bool
  method forward_word_end : unit -> bool
  method forward_word_ends : int -> bool
  method get_buffer : unit -> text_buffer_t
  method get_bytes_in_line : unit -> int
  method get_char : unit -> int
  method get_chars_in_line : unit -> int

  method get_child_anchor :
    unit -> GText_child_anchor.text_child_anchor_t option

  method get_language : unit -> Ocgtk_pango.Pango.Language.language_t
  method get_line : unit -> int
  method get_line_index : unit -> int
  method get_line_offset : unit -> int
  method get_marks : unit -> text_mark_t list
  method get_offset : unit -> int
  method get_paintable : unit -> Ocgtk_gdk.Gdk.Paintable.paintable_t option

  method get_slice :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string

  method get_tags : unit -> GText_tag.text_tag_t list

  method get_text :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string

  method get_toggled_tags : bool -> GText_tag.text_tag_t list
  method get_visible_line_index : unit -> int
  method get_visible_line_offset : unit -> int

  method get_visible_slice :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string

  method get_visible_text :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string

  method has_tag : GText_tag.text_tag_t -> bool

  method in_range :
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
    bool

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
  method starts_tag : GText_tag.text_tag_t option -> bool
  method starts_word : unit -> bool
  method toggles_tag : GText_tag.text_tag_t option -> bool
  method as_text_iter : Text_buffer_and__text_iter_and__text_mark.Text_iter.t
end

and text_mark_t = object
  method get_buffer : unit -> text_buffer_t option
  method get_deleted : unit -> bool
  method get_left_gravity : unit -> bool
  method get_name : unit -> string option
  method get_visible : unit -> bool
  method set_visible : bool -> unit
  method as_text_mark : Text_buffer_and__text_iter_and__text_mark.Text_mark.t
end

class text_buffer
  (obj : Text_buffer_and__text_iter_and__text_mark.Text_buffer.t) :
  text_buffer_t =
  object (self)
    method on_begin_user_action ~callback =
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.on_begin_user_action
        self#as_text_buffer ~callback

    method on_changed ~callback =
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.on_changed
        self#as_text_buffer ~callback

    method on_end_user_action ~callback =
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.on_end_user_action
        self#as_text_buffer ~callback

    method on_modified_changed ~callback =
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.on_modified_changed
        self#as_text_buffer ~callback

    method on_redo ~callback =
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.on_redo
        self#as_text_buffer ~callback

    method on_undo ~callback =
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.on_undo
        self#as_text_buffer ~callback

    method add_mark :
        text_mark_t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun mark where ->
        let mark = mark#as_text_mark in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.add_mark obj mark
          where

    method add_selection_clipboard : Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> unit
        =
      fun clipboard ->
        let clipboard = clipboard#as_clipboard in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .add_selection_clipboard obj clipboard

    method apply_tag :
        GText_tag.text_tag_t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun tag start end_ ->
        let tag = tag#as_text_tag in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.apply_tag obj tag
          start end_

    method apply_tag_by_name :
        string ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun name start end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.apply_tag_by_name
          obj name start end_

    method backspace :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        bool ->
        bool ->
        bool =
      fun iter interactive default_editable ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.backspace obj iter
          interactive default_editable

    method begin_irreversible_action : unit -> unit =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .begin_irreversible_action obj

    method begin_user_action : unit -> unit =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.begin_user_action
          obj

    method copy_clipboard : Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> unit =
      fun clipboard ->
        let clipboard = clipboard#as_clipboard in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.copy_clipboard obj
          clipboard

    method create_child_anchor :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        GText_child_anchor.text_child_anchor_t =
      fun iter ->
        new GText_child_anchor.text_child_anchor
          (Text_buffer_and__text_iter_and__text_mark.Text_buffer
           .create_child_anchor obj iter)

    method create_mark :
        string option ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        bool ->
        text_mark_t =
      fun mark_name where left_gravity ->
        new text_mark
          (Text_buffer_and__text_iter_and__text_mark.Text_buffer.create_mark obj
             mark_name where left_gravity)

    method cut_clipboard : Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> bool -> unit =
      fun clipboard default_editable ->
        let clipboard = clipboard#as_clipboard in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.cut_clipboard obj
          clipboard default_editable

    method delete :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun start end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete obj start
          end_

    method delete_interactive :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        bool ->
        bool =
      fun start_iter end_iter default_editable ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete_interactive
          obj start_iter end_iter default_editable

    method delete_mark : text_mark_t -> unit =
      fun mark ->
        let mark = mark#as_text_mark in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete_mark obj
          mark

    method delete_mark_by_name : string -> unit =
      fun name ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .delete_mark_by_name obj name

    method delete_selection : bool -> bool -> bool =
      fun interactive default_editable ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.delete_selection
          obj interactive default_editable

    method end_irreversible_action : unit -> unit =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .end_irreversible_action obj

    method end_user_action : unit -> unit =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.end_user_action
          obj

    method get_can_redo : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_can_redo obj

    method get_can_undo : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_can_undo obj

    method get_char_count : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_char_count obj

    method get_enable_undo : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_enable_undo
          obj

    method get_has_selection : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_has_selection
          obj

    method get_insert : unit -> text_mark_t =
      fun () ->
        new text_mark
          (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_insert obj)

    method get_line_count : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_line_count obj

    method get_mark : string -> text_mark_t option =
      fun name ->
        Option.map
          (fun ret -> new text_mark ret)
          (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_mark obj
             name)

    method get_max_undo_levels : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .get_max_undo_levels obj

    method get_modified : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_modified obj

    method get_selection_bound : unit -> text_mark_t =
      fun () ->
        new text_mark
          (Text_buffer_and__text_iter_and__text_mark.Text_buffer
           .get_selection_bound obj)

    method get_selection_content :
        unit -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t =
      fun () ->
        new Ocgtk_gdk.Gdk.Content_provider.content_provider
          (Text_buffer_and__text_iter_and__text_mark.Text_buffer
           .get_selection_content obj)

    method get_slice :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        bool ->
        string =
      fun start end_ include_hidden_chars ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_slice obj
          start end_ include_hidden_chars

    method get_tag_table : unit -> GText_tag_table.text_tag_table_t =
      fun () ->
        new GText_tag_table.text_tag_table
          (Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_tag_table
             obj)

    method get_text :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        bool ->
        string =
      fun start end_ include_hidden_chars ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_text obj start
          end_ include_hidden_chars

    method insert :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        string ->
        int ->
        unit =
      fun iter text len ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert obj iter
          text len

    method insert_at_cursor : string -> int -> unit =
      fun text len ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_at_cursor
          obj text len

    method insert_child_anchor :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        GText_child_anchor.text_child_anchor_t ->
        unit =
      fun iter anchor ->
        let anchor = anchor#as_text_child_anchor in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .insert_child_anchor obj iter anchor

    method insert_interactive :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        string ->
        int ->
        bool ->
        bool =
      fun iter text len default_editable ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_interactive
          obj iter text len default_editable

    method insert_interactive_at_cursor : string -> int -> bool -> bool =
      fun text len default_editable ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .insert_interactive_at_cursor obj text len default_editable

    method insert_markup :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        string ->
        int ->
        unit =
      fun iter markup len ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_markup obj
          iter markup len

    method insert_paintable :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Ocgtk_gdk.Gdk.Paintable.paintable_t ->
        unit =
      fun iter paintable ->
        let paintable = paintable#as_paintable in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_paintable
          obj iter paintable

    method insert_range :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun iter start end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_range obj
          iter start end_

    method insert_range_interactive :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        bool ->
        bool =
      fun iter start end_ default_editable ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .insert_range_interactive obj iter start end_ default_editable

    method move_mark :
        text_mark_t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun mark where ->
        let mark = mark#as_text_mark in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.move_mark obj mark
          where

    method move_mark_by_name :
        string -> Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
        =
      fun name where ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.move_mark_by_name
          obj name where

    method paste_clipboard :
        Ocgtk_gdk.Gdk.Clipboard.clipboard_t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t option ->
        bool ->
        unit =
      fun clipboard override_location default_editable ->
        let clipboard = clipboard#as_clipboard in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.paste_clipboard
          obj clipboard override_location default_editable

    method place_cursor :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit =
      fun where ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.place_cursor obj
          where

    method redo : unit -> unit =
      fun () -> Text_buffer_and__text_iter_and__text_mark.Text_buffer.redo obj

    method remove_all_tags :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun start end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.remove_all_tags
          obj start end_

    method remove_selection_clipboard :
        Ocgtk_gdk.Gdk.Clipboard.clipboard_t -> unit =
      fun clipboard ->
        let clipboard = clipboard#as_clipboard in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .remove_selection_clipboard obj clipboard

    method remove_tag :
        GText_tag.text_tag_t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun tag start end_ ->
        let tag = tag#as_text_tag in
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.remove_tag obj tag
          start end_

    method remove_tag_by_name :
        string ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun name start end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.remove_tag_by_name
          obj name start end_

    method select_range :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        unit =
      fun ins bound ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.select_range obj
          ins bound

    method set_enable_undo : bool -> unit =
      fun enable_undo ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_enable_undo
          obj enable_undo

    method set_max_undo_levels : int -> unit =
      fun max_undo_levels ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer
        .set_max_undo_levels obj max_undo_levels

    method set_modified : bool -> unit =
      fun setting ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_modified obj
          setting

    method set_text : string -> int -> unit =
      fun text len ->
        Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_text obj text
          len

    method undo : unit -> unit =
      fun () -> Text_buffer_and__text_iter_and__text_mark.Text_buffer.undo obj

    method cursor_position =
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_cursor_position
        obj

    method as_text_buffer = obj
  end

and text_iter (obj : Text_buffer_and__text_iter_and__text_mark.Text_iter.t) :
  text_iter_t =
  object (self)
    method assign :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit =
      fun other ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.assign obj other

    method backward_char : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_char obj

    method backward_chars : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_chars obj
          count

    method backward_cursor_position : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_cursor_position obj

    method backward_cursor_positions : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_cursor_positions obj count

    method backward_line : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_line obj

    method backward_lines : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_lines obj
          count

    method backward_sentence_start : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_sentence_start obj

    method backward_sentence_starts : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_sentence_starts obj count

    method backward_to_tag_toggle : GText_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_to_tag_toggle obj tag

    method backward_visible_cursor_position : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_visible_cursor_position obj

    method backward_visible_cursor_positions : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_visible_cursor_positions obj count

    method backward_visible_line : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_visible_line obj

    method backward_visible_lines : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_visible_lines obj count

    method backward_visible_word_start : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_visible_word_start obj

    method backward_visible_word_starts : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .backward_visible_word_starts obj count

    method backward_word_start : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_word_start
          obj

    method backward_word_starts : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.backward_word_starts
          obj count

    method can_insert : bool -> bool =
      fun default_editability ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.can_insert obj
          default_editability

    method compare :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> int =
      fun rhs ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.compare obj rhs

    method editable : bool -> bool =
      fun default_setting ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.editable obj
          default_setting

    method ends_line : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_line obj

    method ends_sentence : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_sentence obj

    method ends_tag : GText_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_tag obj tag

    method ends_word : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.ends_word obj

    method equal : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
        =
      fun rhs ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.equal obj rhs

    method forward_char : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_char obj

    method forward_chars : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_chars obj
          count

    method forward_cursor_position : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_cursor_position obj

    method forward_cursor_positions : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_cursor_positions obj count

    method forward_line : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_line obj

    method forward_lines : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_lines obj
          count

    method forward_sentence_end : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_sentence_end
          obj

    method forward_sentence_ends : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_sentence_ends obj count

    method forward_to_end : unit -> unit =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_to_end obj

    method forward_to_line_end : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_to_line_end
          obj

    method forward_to_tag_toggle : GText_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_to_tag_toggle obj tag

    method forward_visible_cursor_position : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_visible_cursor_position obj

    method forward_visible_cursor_positions : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_visible_cursor_positions obj count

    method forward_visible_line : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_visible_line
          obj

    method forward_visible_lines : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_visible_lines obj count

    method forward_visible_word_end : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_visible_word_end obj

    method forward_visible_word_ends : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .forward_visible_word_ends obj count

    method forward_word_end : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_word_end obj

    method forward_word_ends : int -> bool =
      fun count ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.forward_word_ends
          obj count

    method get_buffer : unit -> text_buffer_t =
      fun () ->
        new text_buffer
          (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_buffer obj)

    method get_bytes_in_line : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_bytes_in_line
          obj

    method get_char : unit -> int =
      fun () -> Text_buffer_and__text_iter_and__text_mark.Text_iter.get_char obj

    method get_chars_in_line : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_chars_in_line
          obj

    method get_child_anchor :
        unit -> GText_child_anchor.text_child_anchor_t option =
      fun () ->
        Option.map
          (fun ret -> new GText_child_anchor.text_child_anchor ret)
          (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_child_anchor
             obj)

    method get_language : unit -> Ocgtk_pango.Pango.Language.language_t =
      fun () ->
        new Ocgtk_pango.Pango.Language.language
          (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_language obj)

    method get_line : unit -> int =
      fun () -> Text_buffer_and__text_iter_and__text_mark.Text_iter.get_line obj

    method get_line_index : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_line_index obj

    method get_line_offset : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_line_offset obj

    method get_marks : unit -> text_mark_t list =
      fun () ->
        (List.map (fun ret -> new text_mark ret))
          (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_marks obj)

    method get_offset : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_offset obj

    method get_paintable : unit -> Ocgtk_gdk.Gdk.Paintable.paintable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gdk.Gdk.Paintable.paintable ret)
          (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_paintable obj)

    method get_slice :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string =
      fun end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_slice obj end_

    method get_tags : unit -> GText_tag.text_tag_t list =
      fun () ->
        (List.map (fun ret -> new GText_tag.text_tag ret))
          (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_tags obj)

    method get_text :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string =
      fun end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_text obj end_

    method get_toggled_tags : bool -> GText_tag.text_tag_t list =
      fun toggled_on ->
        (List.map (fun ret -> new GText_tag.text_tag ret))
          (Text_buffer_and__text_iter_and__text_mark.Text_iter.get_toggled_tags
             obj toggled_on)

    method get_visible_line_index : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .get_visible_line_index obj

    method get_visible_line_offset : unit -> int =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .get_visible_line_offset obj

    method get_visible_slice :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string =
      fun end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_visible_slice
          obj end_

    method get_visible_text :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> string =
      fun end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.get_visible_text obj
          end_

    method has_tag : GText_tag.text_tag_t -> bool =
      fun tag ->
        let tag = tag#as_text_tag in
        Text_buffer_and__text_iter_and__text_mark.Text_iter.has_tag obj tag

    method in_range :
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.t ->
        bool =
      fun start end_ ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.in_range obj start
          end_

    method inside_sentence : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.inside_sentence obj

    method inside_word : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.inside_word obj

    method is_cursor_position : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.is_cursor_position
          obj

    method is_end : unit -> bool =
      fun () -> Text_buffer_and__text_iter_and__text_mark.Text_iter.is_end obj

    method is_start : unit -> bool =
      fun () -> Text_buffer_and__text_iter_and__text_mark.Text_iter.is_start obj

    method order : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> unit
        =
      fun second ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.order obj second

    method set_line : int -> unit =
      fun line_number ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.set_line obj
          line_number

    method set_line_index : int -> unit =
      fun byte_on_line ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.set_line_index obj
          byte_on_line

    method set_line_offset : int -> unit =
      fun char_on_line ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.set_line_offset obj
          char_on_line

    method set_offset : int -> unit =
      fun char_offset ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.set_offset obj
          char_offset

    method set_visible_line_index : int -> unit =
      fun byte_on_line ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .set_visible_line_index obj byte_on_line

    method set_visible_line_offset : int -> unit =
      fun char_on_line ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter
        .set_visible_line_offset obj char_on_line

    method starts_line : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_line obj

    method starts_sentence : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_sentence obj

    method starts_tag : GText_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_tag obj tag

    method starts_word : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_iter.starts_word obj

    method toggles_tag : GText_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Text_buffer_and__text_iter_and__text_mark.Text_iter.toggles_tag obj tag

    method as_text_iter = obj
  end

and text_mark (obj : Text_buffer_and__text_iter_and__text_mark.Text_mark.t) :
  text_mark_t =
  object (self)
    method get_buffer : unit -> text_buffer_t option =
      fun () ->
        Option.map
          (fun ret -> new text_buffer ret)
          (Text_buffer_and__text_iter_and__text_mark.Text_mark.get_buffer obj)

    method get_deleted : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_mark.get_deleted obj

    method get_left_gravity : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_mark.get_left_gravity obj

    method get_name : unit -> string option =
      fun () -> Text_buffer_and__text_iter_and__text_mark.Text_mark.get_name obj

    method get_visible : unit -> bool =
      fun () ->
        Text_buffer_and__text_iter_and__text_mark.Text_mark.get_visible obj

    method set_visible : bool -> unit =
      fun setting ->
        Text_buffer_and__text_iter_and__text_mark.Text_mark.set_visible obj
          setting

    method as_text_mark = obj
  end

let new_ (table : GText_tag_table.text_tag_table_t option) : text_buffer_t =
  let table = Option.map (fun c -> c#as_text_tag_table) table in
  let obj_ = Text_buffer_and__text_iter_and__text_mark.Text_buffer.new_ table in
  new text_buffer obj_

let new_ (name : string option) (left_gravity : bool) : text_mark_t =
  let obj_ =
    Text_buffer_and__text_iter_and__text_mark.Text_mark.new_ name left_gravity
  in
  new text_mark obj_
