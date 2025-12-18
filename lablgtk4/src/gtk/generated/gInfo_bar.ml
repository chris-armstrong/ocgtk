(* Signal class defined in ginfo_bar_signals.ml *)

(* High-level class for InfoBar *)
class info_bar (obj : Info_bar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Info_bar.as_widget obj)
  inherit Ginfo_bar_signals.info_bar_signals obj

  method add_action_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> unit =
    fun child response_id ->
      let child = child#as_widget in
      (Info_bar.add_action_widget obj child response_id)

  method add_button : string -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun button_text response_id -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Info_bar.add_button obj button_text response_id)

  method add_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Info_bar.add_child obj widget)

  method get_message_type : unit -> Gtk_enums.messagetype = fun () -> (Info_bar.get_message_type obj )

  method get_revealed : unit -> bool = fun () -> (Info_bar.get_revealed obj )

  method get_show_close_button : unit -> bool = fun () -> (Info_bar.get_show_close_button obj )

  method remove_action_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Info_bar.remove_action_widget obj widget)

  method remove_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Info_bar.remove_child obj widget)

  method response : int -> unit = fun response_id -> (Info_bar.response obj response_id)

  method set_default_response : int -> unit = fun response_id -> (Info_bar.set_default_response obj response_id)

  method set_message_type : Gtk_enums.messagetype -> unit = fun message_type -> (Info_bar.set_message_type obj message_type)

  method set_response_sensitive : int -> bool -> unit = fun response_id setting -> (Info_bar.set_response_sensitive obj response_id setting)

  method set_revealed : bool -> unit = fun revealed -> (Info_bar.set_revealed obj revealed)

  method set_show_close_button : bool -> unit = fun setting -> (Info_bar.set_show_close_button obj setting)

  method as_widget = (Info_bar.as_widget obj)
    method as_info_bar = obj
end

