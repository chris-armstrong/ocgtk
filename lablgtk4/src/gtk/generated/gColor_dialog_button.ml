(* Signal class defined in gcolor_dialog_button_signals.ml *)

(* High-level class for ColorDialogButton *)
class color_dialog_button (obj : Color_dialog_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Color_dialog_button.as_widget obj)
  inherit Gcolor_dialog_button_signals.color_dialog_button_signals obj

  method get_dialog : unit -> GColor_dialog.color_dialog option =
    fun () ->
      Option.map (fun ret -> new GColor_dialog.color_dialog ret) (Color_dialog_button.get_dialog obj)

  method set_dialog : 'p1. (#GColor_dialog.color_dialog as 'p1) -> unit =
    fun dialog ->
      let dialog = dialog#as_color_dialog in
      (Color_dialog_button.set_dialog obj dialog)

  method as_widget = (Color_dialog_button.as_widget obj)
    method as_color_dialog_button = obj
end

