class type search_entry_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the entry is activated.

      The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.
  *)

  method on_next_match :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user initiates a move to the next match for the current
      search string.

      This is a keybinding signal.

      Applications should connect to it, to implement moving between matches.

      The default bindings for this signal is <kbd>Ctrl</kbd>+<kbd>g</kbd>. *)

  method on_previous_match :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user initiates a move to the previous match for the
      current search string.

      This is a keybinding signal.

      Applications should connect to it, to implement moving between matches.

      The default bindings for this signal is
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>g</kbd>. *)

  method on_search_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted with a delay. The length of the delay can be changed with the
      [Gtk.SearchEntry:search-delay] property. *)

  method on_search_started :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user initiated a search on the entry. *)

  method on_stop_search :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user stops a search via keyboard input.

      This is a keybinding signal.

      Applications should connect to it, to implement hiding the search entry in
      this case.

      The default bindings for this signal is <kbd>Escape</kbd>. *)

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
  (** Whether to activate the default widget when Enter is pressed. *)

  method set_activates_default : bool -> unit
  (** Whether to activate the default widget when Enter is pressed. *)

  method as_search_entry : Raw.Search_entry.t
end

(* High-level class for SearchEntry *)
class search_entry (obj : Raw.Search_entry.t) : search_entry_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Editable.editable (Raw.Editable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Search_entry.on_activate ~after self#as_search_entry ~callback

    method on_next_match ?(after = false) ~callback () =
      Raw.Search_entry.on_next_match ~after self#as_search_entry ~callback

    method on_previous_match ?(after = false) ~callback () =
      Raw.Search_entry.on_previous_match ~after self#as_search_entry ~callback

    method on_search_changed ?(after = false) ~callback () =
      Raw.Search_entry.on_search_changed ~after self#as_search_entry ~callback

    method on_search_started ?(after = false) ~callback () =
      Raw.Search_entry.on_search_started ~after self#as_search_entry ~callback

    method on_stop_search ?(after = false) ~callback () =
      Raw.Search_entry.on_stop_search ~after self#as_search_entry ~callback

    method get_input_hints : unit -> Enums.inputhints =
      fun () -> Raw.Search_entry.get_input_hints obj

    method get_input_purpose : unit -> Enums.inputpurpose =
      fun () -> Raw.Search_entry.get_input_purpose obj

    method get_key_capture_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Search_entry.get_key_capture_widget obj)

    method get_placeholder_text : unit -> string option =
      fun () -> Raw.Search_entry.get_placeholder_text obj

    method get_search_delay : unit -> int =
      fun () -> Raw.Search_entry.get_search_delay obj

    method set_input_hints : Enums.inputhints -> unit =
      fun hints -> Raw.Search_entry.set_input_hints obj hints

    method set_input_purpose : Enums.inputpurpose -> unit =
      fun purpose -> Raw.Search_entry.set_input_purpose obj purpose

    method set_key_capture_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Search_entry.set_key_capture_widget obj widget

    method set_placeholder_text : string option -> unit =
      fun text -> Raw.Search_entry.set_placeholder_text obj text

    method set_search_delay : int -> unit =
      fun delay -> Raw.Search_entry.set_search_delay obj delay

    method activates_default = Raw.Search_entry.get_activates_default obj

    method set_activates_default v =
      Raw.Search_entry.set_activates_default obj v

    method as_search_entry = obj
  end

let new_ () : search_entry_t = new search_entry (Raw.Search_entry.new_ ())
