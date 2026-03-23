(* Signal class defined in gdialog_signals.ml *)

class type dialog_t = object
    inherit GApplication_and__window_and__window_group.window_t
    inherit Gdialog_signals.dialog_signals
    method add_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit
    method add_button : string -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_content_area : unit -> GBox.box_t
    method get_header_bar : unit -> GHeader_bar.header_bar_t
    method get_response_for_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int
    method get_widget_for_response : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method response : int -> unit
    method set_default_response : int -> unit
    method set_response_sensitive : int -> bool -> unit
    method use_header_bar : int
    method as_dialog : Dialog.t
end

(* High-level class for Dialog *)
class dialog (obj : Dialog.t) : dialog_t = object (self)
  inherit GApplication_and__window_and__window_group.window (Obj.magic obj : Application_and__window_and__window_group.Window.t)
  inherit Gdialog_signals.dialog_signals obj

  method add_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit =
    fun child response_id ->
      let child = child#as_widget in
      (Dialog.add_action_widget obj child response_id)

  method add_button : string -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t =
    fun button_text response_id ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Dialog.add_button obj button_text response_id)

  method get_content_area : unit -> GBox.box_t =
    fun () ->
      new  GBox.box(Dialog.get_content_area obj)

  method get_header_bar : unit -> GHeader_bar.header_bar_t =
    fun () ->
      new  GHeader_bar.header_bar(Dialog.get_header_bar obj)

  method get_response_for_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int =
    fun widget ->
      let widget = widget#as_widget in
      (Dialog.get_response_for_widget obj widget)

  method get_widget_for_response : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
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

    method as_dialog = obj
end

let new_ () : dialog_t =
  new dialog (Dialog.new_ ())

