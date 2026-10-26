class type info_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_response :
    ?after:bool ->
    callback:(response_id:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method add_button : string -> int -> Button.button_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_message_type : unit -> Enums.messagetype
  method get_revealed : unit -> bool
  method get_show_close_button : unit -> bool

  method remove_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method response : int -> unit
  method set_default_response : int -> unit
  method set_message_type : Enums.messagetype -> unit
  method set_response_sensitive : int -> bool -> unit
  method set_revealed : bool -> unit
  method set_show_close_button : bool -> unit
  method as_info_bar : Raw.Info_bar.t
end

(* High-level class for InfoBar *)
class info_bar (obj : Raw.Info_bar.t) : info_bar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_close ?(after = false) ~callback () =
      Raw.Info_bar.on_close ~after self#as_info_bar ~callback

    method on_response ?(after = false) ~callback () =
      Raw.Info_bar.on_response ~after self#as_info_bar ~callback

    method add_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        unit =
      fun child response_id ->
        let child = child#as_widget in
        Raw.Info_bar.add_action_widget obj child response_id

    method add_button : string -> int -> Button.button_t =
      fun button_text response_id ->
        new Button.button (Raw.Info_bar.add_button obj button_text response_id)

    method add_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Info_bar.add_child obj widget

    method get_message_type : unit -> Enums.messagetype =
      fun () -> Raw.Info_bar.get_message_type obj

    method get_revealed : unit -> bool = fun () -> Raw.Info_bar.get_revealed obj

    method get_show_close_button : unit -> bool =
      fun () -> Raw.Info_bar.get_show_close_button obj

    method remove_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Info_bar.remove_action_widget obj widget

    method remove_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Info_bar.remove_child obj widget

    method response : int -> unit =
      fun response_id -> Raw.Info_bar.response obj response_id

    method set_default_response : int -> unit =
      fun response_id -> Raw.Info_bar.set_default_response obj response_id

    method set_message_type : Enums.messagetype -> unit =
      fun message_type -> Raw.Info_bar.set_message_type obj message_type

    method set_response_sensitive : int -> bool -> unit =
      fun response_id setting ->
        Raw.Info_bar.set_response_sensitive obj response_id setting

    method set_revealed : bool -> unit =
      fun revealed -> Raw.Info_bar.set_revealed obj revealed

    method set_show_close_button : bool -> unit =
      fun setting -> Raw.Info_bar.set_show_close_button obj setting

    method as_info_bar = obj
  end

let new_ () : info_bar_t = new info_bar (Raw.Info_bar.new_ ())
