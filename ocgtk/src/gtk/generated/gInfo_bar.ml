(* Signal class defined in ginfo_bar_signals.ml *)

class type info_bar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Ginfo_bar_signals.info_bar_signals
    method add_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit
    method add_button : string -> int -> GButton.button_t
    method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_message_type : unit -> Gtk_enums.messagetype
    method get_revealed : unit -> bool
    method get_show_close_button : unit -> bool
    method remove_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method response : int -> unit
    method set_default_response : int -> unit
    method set_message_type : Gtk_enums.messagetype -> unit
    method set_response_sensitive : int -> bool -> unit
    method set_revealed : bool -> unit
    method set_show_close_button : bool -> unit
    method as_info_bar : Info_bar.t
end

(* High-level class for InfoBar *)
class info_bar (obj : Info_bar.t) : info_bar_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Ginfo_bar_signals.info_bar_signals obj

  method add_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit =
    fun child response_id ->
      let child = child#as_widget in
      (Info_bar.add_action_widget obj child response_id)

  method add_button : string -> int -> GButton.button_t =
    fun button_text response_id ->
      new  GButton.button(Info_bar.add_button obj button_text response_id)

  method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Info_bar.add_child obj widget)

  method get_message_type : unit -> Gtk_enums.messagetype =
    fun () ->
      (Info_bar.get_message_type obj)

  method get_revealed : unit -> bool =
    fun () ->
      (Info_bar.get_revealed obj)

  method get_show_close_button : unit -> bool =
    fun () ->
      (Info_bar.get_show_close_button obj)

  method remove_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Info_bar.remove_action_widget obj widget)

  method remove_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Info_bar.remove_child obj widget)

  method response : int -> unit =
    fun response_id ->
      (Info_bar.response obj response_id)

  method set_default_response : int -> unit =
    fun response_id ->
      (Info_bar.set_default_response obj response_id)

  method set_message_type : Gtk_enums.messagetype -> unit =
    fun message_type ->
      (Info_bar.set_message_type obj message_type)

  method set_response_sensitive : int -> bool -> unit =
    fun response_id setting ->
      (Info_bar.set_response_sensitive obj response_id setting)

  method set_revealed : bool -> unit =
    fun revealed ->
      (Info_bar.set_revealed obj revealed)

  method set_show_close_button : bool -> unit =
    fun setting ->
      (Info_bar.set_show_close_button obj setting)

    method as_info_bar = obj
end

let new_ () : info_bar_t =
  new info_bar (Info_bar.new_ ())

