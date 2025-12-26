(* Signal class defined in gdialog_signals.ml *)

(* High-level class for Dialog *)
class dialog (obj : Dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Dialog.as_widget obj)
  inherit Gdialog_signals.dialog_signals obj

  method add_action_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> unit =
    fun child response_id ->
      let child = child#as_widget in
      (Dialog.add_action_widget obj child response_id)

  method add_button : string -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun button_text response_id ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Dialog.add_button obj button_text response_id)

  method get_content_area : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Dialog.get_content_area obj)

  method get_header_bar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Dialog.get_header_bar obj)

  method get_response_for_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int =
    fun widget ->
      let widget = widget#as_widget in
      (Dialog.get_response_for_widget obj widget)

  method get_widget_for_response : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun response_id ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Dialog.get_widget_for_response obj response_id)

  method response : int -> unit =
    fun response_id ->
      (Dialog.response obj response_id)

  method set_default_response : int -> unit =
    fun response_id ->
      (Dialog.set_default_response obj response_id)

  method set_response_sensitive : int -> bool -> unit =
    fun response_id setting ->
      (Dialog.set_response_sensitive obj response_id setting)

  method use_header_bar = Dialog.get_use_header_bar obj

  method as_widget = (Dialog.as_widget obj)
    method as_dialog = obj
end

