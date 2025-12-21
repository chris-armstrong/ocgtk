(* High-level class for AppChooserDialog *)
class app_chooser_dialog (obj : App_chooser_dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (App_chooser_dialog.as_widget obj)

  method get_heading : unit -> string option =
    fun () ->
      (App_chooser_dialog.get_heading obj)

  method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(App_chooser_dialog.get_widget obj)

  method set_heading : string -> unit =
    fun heading ->
      (App_chooser_dialog.set_heading obj heading)

  method as_widget = (App_chooser_dialog.as_widget obj)
    method as_app_chooser_dialog = obj
end

