(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from search_entry.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_search_entry_new"
external get_activates_default : t -> bool = "ml_gtk_search_entry_get_activates_default"
external set_activates_default : t -> bool -> unit = "ml_gtk_search_entry_set_activates_default"
external get_input_hints : t -> unit = "ml_gtk_search_entry_get_input_hints"
external set_input_hints : t -> unit -> unit = "ml_gtk_search_entry_set_input_hints"
external get_input_purpose : t -> unit = "ml_gtk_search_entry_get_input_purpose"
external set_input_purpose : t -> unit -> unit = "ml_gtk_search_entry_set_input_purpose"
external get_placeholder_text : t -> unit = "ml_gtk_search_entry_get_placeholder_text"
external set_placeholder_text : t -> unit -> unit = "ml_gtk_search_entry_set_placeholder_text"
external get_search_delay : t -> int = "ml_gtk_search_entry_get_search_delay"
external set_search_delay : t -> int -> unit = "ml_gtk_search_entry_set_search_delay"
external set_key_capture_widget : t -> Gtk.Widget.t -> unit = "ml_gtk_search_entry_set_key_capture_widget"
external get_key_capture_widget : t -> Gtk.Widget.t = "ml_gtk_search_entry_get_key_capture_widget"

(* Summary:
 * - 1 type declarations
 * - 13 external bindings
 *)
