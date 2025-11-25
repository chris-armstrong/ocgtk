(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SearchEntry *)

type t = [`search_entry | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new SearchEntry *)
external new_ : unit -> t = "ml_gtk_search_entry_new"

(* Properties *)

(** Set the delay to be used between the last keypress and the
[signal@Gtk.SearchEntry::search-changed] signal being emitted. *)
external set_search_delay : t -> int -> unit = "ml_gtk_search_entry_set_search_delay"

(** Sets the placeholder text associated with @entry. *)
external set_placeholder_text : t -> string option -> unit = "ml_gtk_search_entry_set_placeholder_text"

(** Sets @widget as the widget that @entry will capture key
events from.

Key events are consumed by the search entry to start or
continue a search.

If the entry is part of a `GtkSearchBar`, it is preferable
to call [method@Gtk.SearchBar.set_key_capture_widget] instead,
which will reveal the entry in addition to triggering the
search entry.

Note that despite the name of this function, the events
are only 'captured' in the bubble phase, which means that
editable child widgets of @widget will receive text input
before it gets captured. If that is not desired, you can
capture and forward the events yourself with
[method@Gtk.EventControllerKey.forward]. *)
external set_key_capture_widget : t -> Gtk.widget option -> unit = "ml_gtk_search_entry_set_key_capture_widget"

(** Sets the input purpose of @entry. *)
external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_search_entry_set_input_purpose"

(** Sets the input hints for @entry. *)
external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_search_entry_set_input_hints"

(** Get the delay to be used between the last keypress and the
[signal@Gtk.SearchEntry::search-changed] signal being emitted. *)
external get_search_delay : t -> int = "ml_gtk_search_entry_get_search_delay"

(** Gets the placeholder text associated with @entry. *)
external get_placeholder_text : t -> string = "ml_gtk_search_entry_get_placeholder_text"

(** Gets the widget that @entry is capturing key events from. *)
external get_key_capture_widget : t -> Gtk.widget = "ml_gtk_search_entry_get_key_capture_widget"

(** Gets the input purpose of @entry. *)
external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_search_entry_get_input_purpose"

(** Gets the input purpose for @entry. *)
external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_search_entry_get_input_hints"

