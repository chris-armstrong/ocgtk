(* GENERATED CODE - DO NOT EDIT *)
(* Widget: EntryCompletion *)

type t = Gtk.Widget.t

(** Create a new EntryCompletion *)
external new_ : unit -> t = "ml_gtk_entry_completion_new"

(** Create a new EntryCompletion *)
external new_with_area : Gtk.Widget.t -> t = "ml_gtk_entry_completion_new_with_area"

(* Properties *)

(** Get property: inline-completion *)
external get_inline_completion : t -> bool = "ml_gtk_entry_completion_get_inline_completion"

(** Set property: inline-completion *)
external set_inline_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_completion"

(** Get property: inline-selection *)
external get_inline_selection : t -> bool = "ml_gtk_entry_completion_get_inline_selection"

(** Set property: inline-selection *)
external set_inline_selection : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_selection"

(** Get property: minimum-key-length *)
external get_minimum_key_length : t -> int = "ml_gtk_entry_completion_get_minimum_key_length"

(** Set property: minimum-key-length *)
external set_minimum_key_length : t -> int -> unit = "ml_gtk_entry_completion_set_minimum_key_length"

(** Get property: popup-completion *)
external get_popup_completion : t -> bool = "ml_gtk_entry_completion_get_popup_completion"

(** Set property: popup-completion *)
external set_popup_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_completion"

(** Get property: popup-set-width *)
external get_popup_set_width : t -> bool = "ml_gtk_entry_completion_get_popup_set_width"

(** Set property: popup-set-width *)
external set_popup_set_width : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_set_width"

(** Get property: popup-single-match *)
external get_popup_single_match : t -> bool = "ml_gtk_entry_completion_get_popup_single_match"

(** Set property: popup-single-match *)
external set_popup_single_match : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_single_match"

(** Get property: text-column *)
external get_text_column : t -> int = "ml_gtk_entry_completion_get_text_column"

(** Set property: text-column *)
external set_text_column : t -> int -> unit = "ml_gtk_entry_completion_set_text_column"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_entry_completion_set_model"

external set_match_func : t -> unit -> unit -> unit -> unit = "ml_gtk_entry_completion_set_match_func"

external insert_prefix : t -> unit = "ml_gtk_entry_completion_insert_prefix"

external get_model : t -> Gtk.Widget.t = "ml_gtk_entry_completion_get_model"

external get_entry : t -> Gtk.Widget.t = "ml_gtk_entry_completion_get_entry"

external get_completion_prefix : t -> string = "ml_gtk_entry_completion_get_completion_prefix"

external complete : t -> unit = "ml_gtk_entry_completion_complete"

