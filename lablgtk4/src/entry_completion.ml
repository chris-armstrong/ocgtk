(* GENERATED CODE - DO NOT EDIT *)
(* Widget: EntryCompletion *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_entry_completion_new"

external new_with_area : Gtk.Widget.t -> t = "ml_gtk_entry_completion_new_with_area"

(* Properties *)

external get_inline_completion : t -> bool = "ml_gtk_entry_completion_get_inline_completion"

external set_inline_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_completion"

external get_inline_selection : t -> bool = "ml_gtk_entry_completion_get_inline_selection"

external set_inline_selection : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_selection"

external get_minimum_key_length : t -> int = "ml_gtk_entry_completion_get_minimum_key_length"

external set_minimum_key_length : t -> int -> unit = "ml_gtk_entry_completion_set_minimum_key_length"

external get_popup_completion : t -> bool = "ml_gtk_entry_completion_get_popup_completion"

external set_popup_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_completion"

external get_popup_set_width : t -> bool = "ml_gtk_entry_completion_get_popup_set_width"

external set_popup_set_width : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_set_width"

external get_popup_single_match : t -> bool = "ml_gtk_entry_completion_get_popup_single_match"

external set_popup_single_match : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_single_match"

external get_text_column : t -> int = "ml_gtk_entry_completion_get_text_column"

external set_text_column : t -> int -> unit = "ml_gtk_entry_completion_set_text_column"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_entry_completion_set_model"

external insert_prefix : t -> unit = "ml_gtk_entry_completion_insert_prefix"

external get_model : t -> Gtk.Widget.t = "ml_gtk_entry_completion_get_model"

external get_entry : t -> Gtk.Widget.t = "ml_gtk_entry_completion_get_entry"

external get_completion_prefix : t -> string = "ml_gtk_entry_completion_get_completion_prefix"

external complete : t -> unit = "ml_gtk_entry_completion_complete"

