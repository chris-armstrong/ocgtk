(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextBuffer *)

type t = Gtk.widget

external new_ : Gtk.widget option -> t = "ml_gtk_text_buffer_new"

(* Properties *)

external get_can_redo : t -> bool = "ml_gtk_text_buffer_get_can_redo"

external get_can_undo : t -> bool = "ml_gtk_text_buffer_get_can_undo"

external get_cursor_position : t -> int = "ml_gtk_text_buffer_get_cursor_position"

external get_enable_undo : t -> bool = "ml_gtk_text_buffer_get_enable_undo"

external set_enable_undo : t -> bool -> unit = "ml_gtk_text_buffer_set_enable_undo"

external get_has_selection : t -> bool = "ml_gtk_text_buffer_get_has_selection"

external get_text : t -> string = "ml_gtk_text_buffer_get_text"

external set_text : t -> string -> unit = "ml_gtk_text_buffer_set_text"

external undo : t -> unit = "ml_gtk_text_buffer_undo"

external set_modified : t -> bool -> unit = "ml_gtk_text_buffer_set_modified"

external set_max_undo_levels : t -> int -> unit = "ml_gtk_text_buffer_set_max_undo_levels"

external redo : t -> unit = "ml_gtk_text_buffer_redo"

external insert_markup : t -> Gtk.widget -> string -> int -> unit = "ml_gtk_text_buffer_insert_markup"

external insert_interactive_at_cursor : t -> string -> int -> bool -> bool = "ml_gtk_text_buffer_insert_interactive_at_cursor"

external insert_interactive : t -> Gtk.widget -> string -> int -> bool -> bool = "ml_gtk_text_buffer_insert_interactive"

external insert_child_anchor : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_insert_child_anchor"

external insert_at_cursor : t -> string -> int -> unit = "ml_gtk_text_buffer_insert_at_cursor"

external insert : t -> Gtk.widget -> string -> int -> unit = "ml_gtk_text_buffer_insert"

external get_tag_table : t -> Gtk.widget = "ml_gtk_text_buffer_get_tag_table"

external get_start_iter : t -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_start_iter"

external get_selection_bounds : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_text_buffer_get_selection_bounds"

external get_selection_bound : t -> Gtk.widget = "ml_gtk_text_buffer_get_selection_bound"

external get_modified : t -> bool = "ml_gtk_text_buffer_get_modified"

external get_max_undo_levels : t -> int = "ml_gtk_text_buffer_get_max_undo_levels"

external get_mark : t -> string -> Gtk.widget = "ml_gtk_text_buffer_get_mark"

external get_line_count : t -> int = "ml_gtk_text_buffer_get_line_count"

external get_iter_at_offset : t -> Gtk.widget -> int -> unit = "ml_gtk_text_buffer_get_iter_at_offset"

external get_iter_at_mark : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_iter_at_mark"

external get_iter_at_line_offset : t -> Gtk.widget -> int -> int -> bool = "ml_gtk_text_buffer_get_iter_at_line_offset"

external get_iter_at_line_index : t -> Gtk.widget -> int -> int -> bool = "ml_gtk_text_buffer_get_iter_at_line_index"

external get_iter_at_line : t -> Gtk.widget -> int -> bool = "ml_gtk_text_buffer_get_iter_at_line"

external get_iter_at_child_anchor : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_iter_at_child_anchor"

external get_insert : t -> Gtk.widget = "ml_gtk_text_buffer_get_insert"

external get_end_iter : t -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_end_iter"

external get_char_count : t -> int = "ml_gtk_text_buffer_get_char_count"

external get_bounds : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_bounds"

external end_user_action : t -> unit = "ml_gtk_text_buffer_end_user_action"

external end_irreversible_action : t -> unit = "ml_gtk_text_buffer_end_irreversible_action"

external delete_selection : t -> bool -> bool -> bool = "ml_gtk_text_buffer_delete_selection"

external delete_mark_by_name : t -> string -> unit = "ml_gtk_text_buffer_delete_mark_by_name"

external delete_mark : t -> Gtk.widget -> unit = "ml_gtk_text_buffer_delete_mark"

external delete_interactive : t -> Gtk.widget -> Gtk.widget -> bool -> bool = "ml_gtk_text_buffer_delete_interactive"

external delete : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_delete"

external create_child_anchor : t -> Gtk.widget -> Gtk.widget = "ml_gtk_text_buffer_create_child_anchor"

external begin_user_action : t -> unit = "ml_gtk_text_buffer_begin_user_action"

external begin_irreversible_action : t -> unit = "ml_gtk_text_buffer_begin_irreversible_action"

external backspace : t -> Gtk.widget -> bool -> bool -> bool = "ml_gtk_text_buffer_backspace"

