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

    [GtkSearchEntry] uses the [Gtk.AccessibleRole.search_box] role.

    Its methods, signals and properties are on {!class-type-search_entry_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Search_entry}. *)

(** The methods, signals and properties of a [GtkSearchEntry]. *)
class type search_entry_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_next_match :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_previous_match :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_search_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_search_started :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_stop_search :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_input_hints : unit -> Enums.inputhints
  (** Gets the input purpose for [entry]. *)

  method get_input_purpose : unit -> Enums.inputpurpose
  (** Gets the input purpose of [entry]. *)

  method get_key_capture_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the widget that [entry] is capturing key events from. *)

  method get_placeholder_text : unit -> string option
  (** Gets the placeholder text associated with [entry]. *)

  method get_search_delay : unit -> int
  (** Get the delay to be used between the last keypress and the
      [Gtk.SearchEntry::search-changed] signal being emitted. *)

  method set_input_hints : Enums.inputhints -> unit
  (** Sets the input hints for [entry]. *)

  method set_input_purpose : Enums.inputpurpose -> unit
  (** Sets the input purpose of [entry]. *)

  method set_key_capture_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets [widget] as the widget that [entry] will capture key events from.

      Key events are consumed by the search entry to start or continue a search.

      If the entry is part of a [GtkSearchBar], it is preferable to call
      [Gtk.SearchBar.set_key_capture_widget] instead, which will reveal the
      entry in addition to triggering the search entry.

      Note that despite the name of this function, the events are only
      'captured' in the bubble phase, which means that editable child widgets of
      [widget] will receive text input before it gets captured. If that is not
      desired, you can capture and forward the events yourself with
      [Gtk.EventControllerKey.forward]. *)

  method set_placeholder_text : string option -> unit
  (** Sets the placeholder text associated with [entry]. *)

  method set_search_delay : int -> unit
  (** Set the delay to be used between the last keypress and the
      [Gtk.SearchEntry::search-changed] signal being emitted. *)

  method activates_default : bool
  method set_activates_default : bool -> unit
  method as_search_entry : Raw.Search_entry.t
end

class search_entry : Raw.Search_entry.t -> search_entry_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Search_entry.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSearchEntry], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> search_entry_t
(** Creates a [GtkSearchEntry]. *)
