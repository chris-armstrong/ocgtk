class type font_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method as_font_chooser_dialog : Font_chooser_dialog.t
end

(* High-level class for FontChooserDialog *)
class font_chooser_dialog (obj : Font_chooser_dialog.t) : font_chooser_dialog_t = object (self)
  inherit GDialog.dialog (obj :> Dialog.t)

    method as_font_chooser_dialog = obj
end

let new_ (title : string option) (parent : GApplication_and__window_and__window_group.window_t option) : font_chooser_dialog_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  new font_chooser_dialog (Font_chooser_dialog.new_ title parent)

