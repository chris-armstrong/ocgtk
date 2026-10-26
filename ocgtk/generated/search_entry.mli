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

val new_ : unit -> search_entry_t
