class type app_chooser_dialog_t = object
    inherit GDialog.dialog_t
    inherit GApp_chooser.app_chooser_t
    method get_heading : unit -> string option
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method set_heading : string -> unit
    method gfile : Ocgtk_gio.Gio.File.file_t
    method as_app_chooser_dialog : App_chooser_dialog.t
end

class app_chooser_dialog : App_chooser_dialog.t -> app_chooser_dialog_t

val new_ : GApplication_and__window_and__window_group.window_t option -> Gtk_enums.dialogflags -> Ocgtk_gio.Gio.File.file_t -> app_chooser_dialog_t
val new_for_content_type : GApplication_and__window_and__window_group.window_t option -> Gtk_enums.dialogflags -> string -> app_chooser_dialog_t
