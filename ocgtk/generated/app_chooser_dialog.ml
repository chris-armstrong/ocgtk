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

(* High-level class for AppChooserDialog *)
class app_chooser_dialog (obj : Raw.App_chooser_dialog.t) : app_chooser_dialog_t
  =
  object (self)
    inherit Dialog.dialog (obj :> Raw.Dialog.t)
    inherit App_chooser.app_chooser (Raw.App_chooser.from_gobject obj)

    method get_heading : unit -> string option =
      fun () -> Raw.App_chooser_dialog.get_heading obj

    method get_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.App_chooser_dialog.get_widget obj)

    method set_heading : string -> unit =
      fun heading -> Raw.App_chooser_dialog.set_heading obj heading

    method gfile = new Ocgio.File.file (Raw.App_chooser_dialog.get_gfile obj)
    method as_app_chooser_dialog = obj
  end

let new_ (parent : Application_and__window_and__window_group.window_t option)
    (flags : Enums.dialogflags) (file : Ocgio.File.file_t) :
    app_chooser_dialog_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let file = file#as_file in
  let obj_ = Raw.App_chooser_dialog.new_ parent flags file in
  new app_chooser_dialog obj_

let new_for_content_type
    (parent : Application_and__window_and__window_group.window_t option)
    (flags : Enums.dialogflags) (content_type : string) : app_chooser_dialog_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ =
    Raw.App_chooser_dialog.new_for_content_type parent flags content_type
  in
  new app_chooser_dialog obj_
