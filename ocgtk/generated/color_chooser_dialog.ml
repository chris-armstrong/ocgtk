class type color_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit Color_chooser.color_chooser_t

  method show_editor : bool
  (** Whether the color chooser dialog is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  method set_show_editor : bool -> unit
  (** Whether the color chooser dialog is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  method as_color_chooser_dialog : Raw.Color_chooser_dialog.t
end

(* High-level class for ColorChooserDialog *)
class color_chooser_dialog (obj : Raw.Color_chooser_dialog.t) :
  color_chooser_dialog_t =
  object (self)
    inherit Dialog.dialog (obj :> Raw.Dialog.t)
    inherit Color_chooser.color_chooser (Raw.Color_chooser.from_gobject obj)
    method show_editor = Raw.Color_chooser_dialog.get_show_editor obj
    method set_show_editor v = Raw.Color_chooser_dialog.set_show_editor obj v
    method as_color_chooser_dialog = obj
  end

let new_ (title : string option)
    (parent : Application_and__window_and__window_group.window_t option) :
    color_chooser_dialog_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ = Raw.Color_chooser_dialog.new_ title parent in
  new color_chooser_dialog obj_
