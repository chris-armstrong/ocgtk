class type info_bar_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method on_close : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_response :
    callback:(response_id:int -> unit) -> Gobject.Signal.handler_id

  method add_action_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    int ->
    unit

  method add_button : string -> int -> GButton.button_t

  method add_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method get_message_type : unit -> Gtk_enums.messagetype
  method get_revealed : unit -> bool
  method get_show_close_button : unit -> bool

  method remove_action_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method remove_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method response : int -> unit
  method set_default_response : int -> unit
  method set_message_type : Gtk_enums.messagetype -> unit
  method set_response_sensitive : int -> bool -> unit
  method set_revealed : bool -> unit
  method set_show_close_button : bool -> unit
  method as_info_bar : Info_bar.t
end

class info_bar : Info_bar.t -> info_bar_t

val new_ : unit -> info_bar_t
