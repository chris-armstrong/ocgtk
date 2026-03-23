(* Signal class defined in gcolor_dialog_button_signals.ml *)

class type color_dialog_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gcolor_dialog_button_signals.color_dialog_button_signals
    method get_dialog : unit -> GColor_dialog.color_dialog_t option
    method get_rgba : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method set_dialog : GColor_dialog.color_dialog_t -> unit
    method set_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
    method as_color_dialog_button : Color_dialog_button.t
end

(* High-level class for ColorDialogButton *)
class color_dialog_button (obj : Color_dialog_button.t) : color_dialog_button_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gcolor_dialog_button_signals.color_dialog_button_signals obj

  method get_dialog : unit -> GColor_dialog.color_dialog_t option =
    fun () ->
      Option.map (fun ret -> new GColor_dialog.color_dialog ret) (Color_dialog_button.get_dialog obj)

  method get_rgba : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Rgb_a.rgb_a(Color_dialog_button.get_rgba obj)

  method set_dialog : GColor_dialog.color_dialog_t -> unit =
    fun dialog ->
      let dialog = dialog#as_color_dialog in
      (Color_dialog_button.set_dialog obj dialog)

  method set_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
    fun color ->
      let color = color#as_rgb_a in
      (Color_dialog_button.set_rgba obj color)

    method as_color_dialog_button = obj
end

let new_ (dialog : GColor_dialog.color_dialog_t option) : color_dialog_button_t =
  let dialog = Option.map (fun c -> c#as_color_dialog) dialog in
  new color_dialog_button (Color_dialog_button.new_ dialog)

