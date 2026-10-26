class type dialog_t = object
  inherit Application_and__window_and__window_group.window_t

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

  method add_button :
    string ->
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_content_area : unit -> Box.box_t
  method get_header_bar : unit -> Header_bar.header_bar_t

  method get_response_for_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int

  method get_widget_for_response :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method response : int -> unit
  method set_default_response : int -> unit
  method set_response_sensitive : int -> bool -> unit
  method use_header_bar : int
  method as_dialog : Raw.Dialog.t
end

class dialog : Raw.Dialog.t -> dialog_t

val new_ : unit -> dialog_t
