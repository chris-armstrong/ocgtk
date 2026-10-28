class type font_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit Font_chooser.font_chooser_t

  (** {2:conversions Conversions} *)

  method as_font_chooser_dialog : Raw.Font_chooser_dialog.t
end

(* High-level class for FontChooserDialog *)
class font_chooser_dialog (obj : Raw.Font_chooser_dialog.t) :
  font_chooser_dialog_t =
  object (self)
    inherit Dialog.dialog (obj :> Raw.Dialog.t)
    inherit Font_chooser.font_chooser (Raw.Font_chooser.from_gobject obj)
    method as_font_chooser_dialog = obj
  end

let new_ (title : string option)
    (parent : Application_and__window_and__window_group.window_t option) :
    font_chooser_dialog_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ = Raw.Font_chooser_dialog.new_ title parent in
  new font_chooser_dialog obj_
