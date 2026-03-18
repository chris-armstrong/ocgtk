(* Signal class defined in gcolor_dialog_button_signals.ml *)

(* High-level class for ColorDialogButton *)
class color_dialog_button (obj : Color_dialog_button.t) = object (self)
  inherit Gcolor_dialog_button_signals.color_dialog_button_signals obj

  method get_dialog : unit -> GColor_dialog.color_dialog option =
    fun () ->
      Option.map (fun ret -> new GColor_dialog.color_dialog ret) (Color_dialog_button.get_dialog obj)

  method get_rgba : unit -> Ocgtk_gdk.Gdk.rgb_a =
    fun () ->
      new  Ocgtk_gdk.Gdk.rgb_a(Color_dialog_button.get_rgba obj)

  method set_dialog : 'p1. (#GColor_dialog.color_dialog as 'p1) -> unit =
    fun dialog ->
      let dialog = dialog#as_color_dialog in
      (Color_dialog_button.set_dialog obj dialog)

  method set_rgba : 'p1. (#Ocgtk_gdk.Gdk.rgb_a as 'p1) -> unit =
    fun color ->
      let color = color#as_rgb_a in
      (Color_dialog_button.set_rgba obj color)

    method as_color_dialog_button = obj
end

