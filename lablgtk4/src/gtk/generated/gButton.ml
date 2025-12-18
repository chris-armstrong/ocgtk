(* Signal class defined in gbutton_signals.ml *)

(* High-level class for Button *)
class button (obj : Button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Button.as_widget obj)
  inherit Gbutton_signals.button_signals obj

  method can_shrink = Button.get_can_shrink obj
  method set_can_shrink v = Button.set_can_shrink obj v

  method has_frame = Button.get_has_frame obj
  method set_has_frame v = Button.set_has_frame obj v

  method icon_name = Button.get_icon_name obj
  method set_icon_name v = Button.set_icon_name obj v

  method label = Button.get_label obj
  method set_label v = Button.set_label obj v

  method use_underline = Button.get_use_underline obj
  method set_use_underline v = Button.set_use_underline obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Button.get_child obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Button.set_child obj child)

  method as_widget = (Button.as_widget obj)
    method as_button = obj
end

