(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextBuffer *)

type t = Gtk.Widget.t

(** Create a new TextBuffer *)
external new_ : Gtk.Widget.t option -> t = "ml_gtk_text_buffer_new"

(* Properties *)

(** Get property: can-redo *)
external get_can_redo : t -> bool = "ml_gtk_text_buffer_get_can_redo"

(** Get property: can-undo *)
external get_can_undo : t -> bool = "ml_gtk_text_buffer_get_can_undo"

(** Get property: cursor-position *)
external get_cursor_position : t -> int = "ml_gtk_text_buffer_get_cursor_position"

(** Get property: enable-undo *)
external get_enable_undo : t -> bool = "ml_gtk_text_buffer_get_enable_undo"

(** Set property: enable-undo *)
external set_enable_undo : t -> bool -> unit = "ml_gtk_text_buffer_set_enable_undo"

(** Get property: has-selection *)
external get_has_selection : t -> bool = "ml_gtk_text_buffer_get_has_selection"

external undo : t -> unit = "ml_gtk_text_buffer_undo"

external set_text : t -> string -> unit -> unit = "ml_gtk_text_buffer_set_text"

external set_modified : t -> bool -> unit = "ml_gtk_text_buffer_set_modified"

external set_max_undo_levels : t -> int -> unit = "ml_gtk_text_buffer_set_max_undo_levels"

external select_range : t -> unit -> unit -> unit = "ml_gtk_text_buffer_select_range"

external remove_tag_by_name : t -> string -> unit -> unit -> unit = "ml_gtk_text_buffer_remove_tag_by_name"

external remove_tag : t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_text_buffer_remove_tag"

external remove_selection_clipboard : t -> unit -> unit = "ml_gtk_text_buffer_remove_selection_clipboard"

external remove_all_tags : t -> unit -> unit -> unit = "ml_gtk_text_buffer_remove_all_tags"

external redo : t -> unit = "ml_gtk_text_buffer_redo"

external place_cursor : t -> unit -> unit = "ml_gtk_text_buffer_place_cursor"

external paste_clipboard : t -> unit -> Gtk.Widget.t option -> bool -> unit = "ml_gtk_text_buffer_paste_clipboard"

external move_mark_by_name : t -> string -> unit -> unit = "ml_gtk_text_buffer_move_mark_by_name"

external move_mark : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_text_buffer_move_mark"

external insert_range_interactive : t -> Gtk.Widget.t -> unit -> unit -> bool -> bool = "ml_gtk_text_buffer_insert_range_interactive"

external insert_range : t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_text_buffer_insert_range"

external insert_paintable : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_text_buffer_insert_paintable"

external insert_markup : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_text_buffer_insert_markup"

external insert_interactive_at_cursor : t -> string -> unit -> bool -> bool = "ml_gtk_text_buffer_insert_interactive_at_cursor"

external insert_interactive : t -> Gtk.Widget.t -> string -> unit -> bool -> bool = "ml_gtk_text_buffer_insert_interactive"

external insert_child_anchor : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_insert_child_anchor"

external insert_at_cursor : t -> string -> unit -> unit = "ml_gtk_text_buffer_insert_at_cursor"

external insert : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_text_buffer_insert"

external get_text : t -> unit -> unit -> bool -> unit = "ml_gtk_text_buffer_get_text"

external get_tag_table : t -> Gtk.Widget.t = "ml_gtk_text_buffer_get_tag_table"

external get_start_iter : t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_get_start_iter"

external get_slice : t -> unit -> unit -> bool -> unit = "ml_gtk_text_buffer_get_slice"

external get_selection_content : t -> unit = "ml_gtk_text_buffer_get_selection_content"

external get_selection_bounds : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_text_buffer_get_selection_bounds"

external get_selection_bound : t -> Gtk.Widget.t = "ml_gtk_text_buffer_get_selection_bound"

external get_modified : t -> bool = "ml_gtk_text_buffer_get_modified"

external get_max_undo_levels : t -> int = "ml_gtk_text_buffer_get_max_undo_levels"

external get_mark : t -> string -> Gtk.Widget.t = "ml_gtk_text_buffer_get_mark"

external get_line_count : t -> unit = "ml_gtk_text_buffer_get_line_count"

external get_iter_at_offset : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_text_buffer_get_iter_at_offset"

external get_iter_at_mark : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_get_iter_at_mark"

external get_iter_at_line_offset : t -> Gtk.Widget.t -> unit -> unit -> bool = "ml_gtk_text_buffer_get_iter_at_line_offset"

external get_iter_at_line_index : t -> Gtk.Widget.t -> unit -> unit -> bool = "ml_gtk_text_buffer_get_iter_at_line_index"

external get_iter_at_line : t -> Gtk.Widget.t -> unit -> bool = "ml_gtk_text_buffer_get_iter_at_line"

external get_iter_at_child_anchor : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_get_iter_at_child_anchor"

external get_insert : t -> Gtk.Widget.t = "ml_gtk_text_buffer_get_insert"

external get_end_iter : t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_get_end_iter"

external get_char_count : t -> int = "ml_gtk_text_buffer_get_char_count"

external get_bounds : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_get_bounds"

external end_user_action : t -> unit = "ml_gtk_text_buffer_end_user_action"

external end_irreversible_action : t -> unit = "ml_gtk_text_buffer_end_irreversible_action"

external delete_selection : t -> bool -> bool -> bool = "ml_gtk_text_buffer_delete_selection"

external delete_mark_by_name : t -> string -> unit = "ml_gtk_text_buffer_delete_mark_by_name"

external delete_mark : t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_delete_mark"

external delete_interactive : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool -> bool = "ml_gtk_text_buffer_delete_interactive"

external delete : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_text_buffer_delete"

external cut_clipboard : t -> unit -> bool -> unit = "ml_gtk_text_buffer_cut_clipboard"

external create_mark : t -> string option -> unit -> bool -> Gtk.Widget.t = "ml_gtk_text_buffer_create_mark"

external create_child_anchor : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_text_buffer_create_child_anchor"

external copy_clipboard : t -> unit -> unit = "ml_gtk_text_buffer_copy_clipboard"

external begin_user_action : t -> unit = "ml_gtk_text_buffer_begin_user_action"

external begin_irreversible_action : t -> unit = "ml_gtk_text_buffer_begin_irreversible_action"

external backspace : t -> Gtk.Widget.t -> bool -> bool -> bool = "ml_gtk_text_buffer_backspace"

external apply_tag_by_name : t -> string -> unit -> unit -> unit = "ml_gtk_text_buffer_apply_tag_by_name"

external apply_tag : t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_text_buffer_apply_tag"

external add_selection_clipboard : t -> unit -> unit = "ml_gtk_text_buffer_add_selection_clipboard"

external add_mark : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_text_buffer_add_mark"

