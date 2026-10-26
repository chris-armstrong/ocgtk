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
