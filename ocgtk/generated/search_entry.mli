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

    Its methods, signals and properties are on {!class-type-search_entry_t}. The
    functions it is built on are in {!Ocgtk.Raw.Search_entry}. *)

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
  method get_input_purpose : unit -> Enums.inputpurpose

  method get_key_capture_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_placeholder_text : unit -> string option
  method get_search_delay : unit -> int
  method set_input_hints : Enums.inputhints -> unit
  method set_input_purpose : Enums.inputpurpose -> unit

  method set_key_capture_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_placeholder_text : string option -> unit
  method set_search_delay : int -> unit
  method activates_default : bool
  method set_activates_default : bool -> unit
  method as_search_entry : Raw.Search_entry.t
end

class search_entry : Raw.Search_entry.t -> search_entry_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Search_entry.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSearchEntry], give one already wrapped. *)

val new_ : unit -> search_entry_t
