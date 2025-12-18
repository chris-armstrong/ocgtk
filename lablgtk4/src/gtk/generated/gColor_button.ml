(* Signal class defined in gcolor_button_signals.ml *)

(* High-level class for ColorButton *)
class color_button (obj : Color_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Color_button.as_widget obj)
  inherit Gcolor_button_signals.color_button_signals obj

  method get_modal : unit -> bool = fun () -> (Color_button.get_modal obj )

  method get_title : unit -> string = fun () -> (Color_button.get_title obj )

  method set_modal : bool -> unit = fun modal -> (Color_button.set_modal obj modal)

  method set_title : string -> unit = fun title -> (Color_button.set_title obj title)

  method as_widget = (Color_button.as_widget obj)
    method as_color_button = obj
end

