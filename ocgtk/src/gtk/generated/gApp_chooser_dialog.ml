class type app_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method get_heading : unit -> string option
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method set_heading : string -> unit
    method gfile : Ocgtk_gio.Gio.file_t
    method as_app_chooser_dialog : App_chooser_dialog.t
end

(* High-level class for AppChooserDialog *)
class app_chooser_dialog (obj : App_chooser_dialog.t) : app_chooser_dialog_t = object (self)
  inherit GDialog.dialog (Obj.magic obj : Dialog.t)

  method get_heading : unit -> string option =
    fun () ->
      (App_chooser_dialog.get_heading obj)

  method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(App_chooser_dialog.get_widget obj)

  method set_heading : string -> unit =
    fun heading ->
      (App_chooser_dialog.set_heading obj heading)

  method gfile = new Ocgtk_gio.Gio.file (App_chooser_dialog.get_gfile obj)

    method as_app_chooser_dialog = obj
end

