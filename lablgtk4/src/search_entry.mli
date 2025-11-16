(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SearchEntry *)

type t = Gtk.Widget.t

(** Create a new SearchEntry *)
external new_ : unit -> t = "ml_gtk_search_entry_new"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_search_entry_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_search_entry_set_activates_default"

(** Get property: input-hints *)
external get_input_hints : t -> unit = "ml_gtk_search_entry_get_input_hints"

(** Set property: input-hints *)
external set_input_hints : t -> unit -> unit = "ml_gtk_search_entry_set_input_hints"

(** Get property: input-purpose *)
external get_input_purpose : t -> unit = "ml_gtk_search_entry_get_input_purpose"

(** Set property: input-purpose *)
external set_input_purpose : t -> unit -> unit = "ml_gtk_search_entry_set_input_purpose"

(** Get property: placeholder-text *)
external get_placeholder_text : t -> unit = "ml_gtk_search_entry_get_placeholder_text"

(** Set property: placeholder-text *)
external set_placeholder_text : t -> unit -> unit = "ml_gtk_search_entry_set_placeholder_text"

(** Get property: search-delay *)
external get_search_delay : t -> int = "ml_gtk_search_entry_get_search_delay"

(** Set property: search-delay *)
external set_search_delay : t -> int -> unit = "ml_gtk_search_entry_set_search_delay"

external set_key_capture_widget : t -> Gtk.Widget.t -> unit = "ml_gtk_search_entry_set_key_capture_widget"

external get_key_capture_widget : t -> Gtk.Widget.t = "ml_gtk_search_entry_get_key_capture_widget"

