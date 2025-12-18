(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SearchEntry *)

type t = [`search_entry | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new SearchEntry *)
external new_ : unit -> t = "ml_gtk_search_entry_new"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_search_entry_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_search_entry_set_activates_default"

(** Get property: placeholder-text *)
external get_placeholder_text : t -> string = "ml_gtk_search_entry_get_placeholder_text"

(** Set property: placeholder-text *)
external set_placeholder_text : t -> string -> unit = "ml_gtk_search_entry_set_placeholder_text"

(** Get property: search-delay *)
external get_search_delay : t -> int = "ml_gtk_search_entry_get_search_delay"

(** Set property: search-delay *)
external set_search_delay : t -> int -> unit = "ml_gtk_search_entry_set_search_delay"

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
external set_key_capture_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_search_entry_set_key_capture_widget"

(** Sets the input purpose of @entry. *)
external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_search_entry_set_input_purpose"

(** Sets the input hints for @entry. *)
external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_search_entry_set_input_hints"

(** Gets the widget that @entry is capturing key events from. *)
external get_key_capture_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_search_entry_get_key_capture_widget"

(** Gets the input purpose of @entry. *)
external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_search_entry_get_input_purpose"

(** Gets the input purpose for @entry. *)
external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_search_entry_get_input_hints"

