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

(* High-level class for IMContext *)
class im_context (obj : Raw.Im_context.t) : im_context_t =
  object (self)
    method on_commit ?(after = false) ~callback () =
      Raw.Im_context.on_commit ~after self#as_im_context ~callback

    method on_delete_surrounding ?(after = false) ~callback () =
      Raw.Im_context.on_delete_surrounding ~after self#as_im_context ~callback

    method on_preedit_changed ?(after = false) ~callback () =
      Raw.Im_context.on_preedit_changed ~after self#as_im_context ~callback

    method on_preedit_end ?(after = false) ~callback () =
      Raw.Im_context.on_preedit_end ~after self#as_im_context ~callback

    method on_preedit_start ?(after = false) ~callback () =
      Raw.Im_context.on_preedit_start ~after self#as_im_context ~callback

    method on_retrieve_surrounding ?(after = false) ~callback () =
      Raw.Im_context.on_retrieve_surrounding ~after self#as_im_context ~callback

    method activate_osk : Ocgdk.Event.event_t option -> bool =
      fun event ->
        let event = Option.map (fun c -> c#as_event) event in
        Raw.Im_context.activate_osk obj event

    method delete_surrounding : int -> int -> bool =
      fun offset n_chars -> Raw.Im_context.delete_surrounding obj offset n_chars

    method filter_key :
        bool ->
        Ocgdk.Surface.surface_t ->
        Ocgdk.Device.device_t ->
        UInt32.t ->
        int ->
        Ocgdk.Enums.modifiertype ->
        int ->
        bool =
      fun press surface device time keycode state group ->
        let surface = surface#as_surface in
        let device = device#as_device in
        Raw.Im_context.filter_key obj press surface device time keycode state
          group

    method filter_keypress : Ocgdk.Event.event_t -> bool =
      fun event ->
        let event = event#as_event in
        Raw.Im_context.filter_keypress obj event

    method focus_in : unit -> unit = fun () -> Raw.Im_context.focus_in obj
    method focus_out : unit -> unit = fun () -> Raw.Im_context.focus_out obj
    method reset : unit -> unit = fun () -> Raw.Im_context.reset obj

    method set_client_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Im_context.set_client_widget obj widget

    method set_cursor_location : Ocgdk.Rectangle.rectangle_t -> unit =
      fun area ->
        let area = area#as_rectangle in
        Raw.Im_context.set_cursor_location obj area

    method set_surrounding : string -> int -> int -> unit =
      fun text len cursor_index ->
        Raw.Im_context.set_surrounding obj text len cursor_index

    method set_surrounding_with_selection : string -> int -> int -> int -> unit
        =
      fun text len cursor_index anchor_index ->
        Raw.Im_context.set_surrounding_with_selection obj text len cursor_index
          anchor_index

    method set_use_preedit : bool -> unit =
      fun use_preedit -> Raw.Im_context.set_use_preedit obj use_preedit

    method input_hints = Raw.Im_context.get_input_hints obj
    method set_input_hints v = Raw.Im_context.set_input_hints obj v
    method input_purpose = Raw.Im_context.get_input_purpose obj
    method set_input_purpose v = Raw.Im_context.set_input_purpose obj v
    method as_im_context = obj
  end
