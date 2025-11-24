(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SearchEntry *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_search_entry_new"

(* Properties *)

external get_activates_default : t -> bool = "ml_gtk_search_entry_get_activates_default"

external set_activates_default : t -> bool -> unit = "ml_gtk_search_entry_set_activates_default"

external get_placeholder_text : t -> string = "ml_gtk_search_entry_get_placeholder_text"

external set_placeholder_text : t -> string -> unit = "ml_gtk_search_entry_set_placeholder_text"

external get_search_delay : t -> int = "ml_gtk_search_entry_get_search_delay"

external set_search_delay : t -> int -> unit = "ml_gtk_search_entry_set_search_delay"

external set_key_capture_widget : t -> Gtk.widget option -> unit = "ml_gtk_search_entry_set_key_capture_widget"

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_search_entry_set_input_purpose"

external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_search_entry_set_input_hints"

external get_key_capture_widget : t -> Gtk.widget = "ml_gtk_search_entry_get_key_capture_widget"

external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_search_entry_get_input_purpose"

external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_search_entry_get_input_hints"

