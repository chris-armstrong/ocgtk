class type color_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_chooser_dialog : Color_chooser_dialog.t
end

(* High-level class for ColorChooserDialog *)
class color_chooser_dialog (obj : Color_chooser_dialog.t) : color_chooser_dialog_t = object (self)
  inherit GDialog.dialog (Obj.magic obj : Dialog.t)

  method show_editor = Color_chooser_dialog.get_show_editor obj
  method set_show_editor v =  Color_chooser_dialog.set_show_editor obj v

    method as_color_chooser_dialog = obj
end

