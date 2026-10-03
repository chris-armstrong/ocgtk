(* GENERATED CODE - DO NOT EDIT *)
(* SearchEntry: SearchEntry *)

type t = [ `search_entry | `widget | `initially_unowned | `object_ ] Gobject.obj
(** A single-line text entry widget for use as a search entry.

    The main API for interacting with a [GtkSearchEntry] as entry is the
    [GtkEditable] interface.

    An example GtkSearchEntry

    It will show an inactive symbolic “find” icon when the search entry is
    empty, and a symbolic “clear” icon when there is text. Clicking on the
    “clear” icon will empty the search entry.

    To make filtering appear more reactive, it is a good idea to not react to
    every change in the entry text immediately, but only after a short delay. To
    support this, [GtkSearchEntry] emits the [Gtk.SearchEntry::search-changed]
    signal which can be used instead of the [Gtk.Editable::changed] signal.

    The [Gtk.SearchEntry::previous-match], [Gtk.SearchEntry::next-match] and
    [Gtk.SearchEntry::stop-search] signals can be used to implement moving
    between search results and ending the search.

    Often, [GtkSearchEntry] will be fed events by means of being placed inside a
    [Gtk.SearchBar]. If that is not the case, you can use
    [Gtk.SearchEntry.set_key_capture_widget] to let it capture key input from
    another widget.

    [GtkSearchEntry] provides only minimal API and should be used with the
    [Gtk.Editable] API.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.SearchEntry::activate]
    - [Gtk.SearchEntry::next-match]
    - [Gtk.SearchEntry::previous-match]
    - [Gtk.SearchEntry::stop-search]

    {b CSS Nodes}

    {[
    entry.search
    ╰── text
    ]}

    [GtkSearchEntry] has a single CSS node with name entry that carries a
    [.search] style class, and the text node is a child of that.

    {b Accessibility}

    [GtkSearchEntry] uses the [Gtk.AccessibleRole.search_box] role. *)

external new_ : unit -> t = "ml_gtk_search_entry_new"
(** Create a new SearchEntry *)

(* Methods *)

external set_search_delay : t -> int -> unit
  = "ml_gtk_search_entry_set_search_delay"
(** Set the delay to be used between the last keypress and the
    [Gtk.SearchEntry::search-changed] signal being emitted. *)

external set_placeholder_text : t -> string option -> unit
  = "ml_gtk_search_entry_set_placeholder_text"
(** Sets the placeholder text associated with [entry]. *)

external set_key_capture_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_search_entry_set_key_capture_widget"
(** Sets [widget] as the widget that [entry] will capture key events from.

    Key events are consumed by the search entry to start or continue a search.

    If the entry is part of a [GtkSearchBar], it is preferable to call
    [Gtk.SearchBar.set_key_capture_widget] instead, which will reveal the entry
    in addition to triggering the search entry.

    Note that despite the name of this function, the events are only 'captured'
    in the bubble phase, which means that editable child widgets of [widget]
    will receive text input before it gets captured. If that is not desired, you
    can capture and forward the events yourself with
    [Gtk.EventControllerKey.forward]. *)

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit
  = "ml_gtk_search_entry_set_input_purpose"
(** Sets the input purpose of [entry]. *)

external set_input_hints : t -> Gtk_enums.inputhints -> unit
  = "ml_gtk_search_entry_set_input_hints"
(** Sets the input hints for [entry]. *)

external get_search_delay : t -> int = "ml_gtk_search_entry_get_search_delay"
(** Get the delay to be used between the last keypress and the
    [Gtk.SearchEntry::search-changed] signal being emitted. *)

external get_placeholder_text : t -> string option
  = "ml_gtk_search_entry_get_placeholder_text"
(** Gets the placeholder text associated with [entry]. *)

external get_key_capture_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_search_entry_get_key_capture_widget"
(** Gets the widget that [entry] is capturing key events from. *)

external get_input_purpose : t -> Gtk_enums.inputpurpose
  = "ml_gtk_search_entry_get_input_purpose"
(** Gets the input purpose of [entry]. *)

external get_input_hints : t -> Gtk_enums.inputhints
  = "ml_gtk_search_entry_get_input_hints"
(** Gets the input purpose for [entry]. *)

(* Properties *)

external get_activates_default : t -> bool
  = "ml_gtk_search_entry_get_activates_default"
(** Get property: activates-default *)

external set_activates_default : t -> bool -> unit
  = "ml_gtk_search_entry_set_activates_default"
(** Set property: activates-default *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_next_match :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_previous_match :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_search_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_search_started :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_stop_search :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
