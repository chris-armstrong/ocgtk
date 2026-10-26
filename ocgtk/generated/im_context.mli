class type im_context_t = object
  method on_commit :
    ?after:bool ->
    callback:(str:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_delete_surrounding :
    ?after:bool ->
    callback:(offset:int -> n_chars:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_preedit_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_preedit_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_preedit_start :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_retrieve_surrounding :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method activate_osk : Ocgdk.Event.event_t option -> bool
  method delete_surrounding : int -> int -> bool

  method filter_key :
    bool ->
    Ocgdk.Surface.surface_t ->
    Ocgdk.Device.device_t ->
    UInt32.t ->
    int ->
    Ocgdk.Enums.modifiertype ->
    int ->
    bool

  method filter_keypress : Ocgdk.Event.event_t -> bool
  method focus_in : unit -> unit
  method focus_out : unit -> unit
  method reset : unit -> unit

  method set_client_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_cursor_location : Ocgdk.Rectangle.rectangle_t -> unit
  method set_surrounding : string -> int -> int -> unit
  method set_surrounding_with_selection : string -> int -> int -> int -> unit
  method set_use_preedit : bool -> unit
  method input_hints : Enums.inputhints
  method set_input_hints : Enums.inputhints -> unit
  method input_purpose : Enums.inputpurpose
  method set_input_purpose : Enums.inputpurpose -> unit
  method as_im_context : Raw.Im_context.t
end

class im_context : Raw.Im_context.t -> im_context_t
