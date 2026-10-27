class type app_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit App_chooser.app_chooser_t
  method get_heading : unit -> string option

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method set_heading : string -> unit
  method gfile : Ocgio.File.file_t
  method as_app_chooser_dialog : Raw.App_chooser_dialog.t
end

class app_chooser_dialog : Raw.App_chooser_dialog.t -> app_chooser_dialog_t

val new_ :
  Application_and__window_and__window_group.window_t option ->
  Enums.dialogflags ->
  Ocgio.File.file_t ->
  app_chooser_dialog_t

val new_for_content_type :
  Application_and__window_and__window_group.window_t option ->
  Enums.dialogflags ->
  string ->
  app_chooser_dialog_t
