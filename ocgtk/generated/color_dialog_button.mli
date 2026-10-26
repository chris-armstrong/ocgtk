class type color_dialog_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_dialog : unit -> Color_dialog.color_dialog_t option
  method get_rgba : unit -> Ocgdk.Rgb_a.rgb_a_t
  method set_dialog : Color_dialog.color_dialog_t -> unit
  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method as_color_dialog_button : Raw.Color_dialog_button.t
end

class color_dialog_button : Raw.Color_dialog_button.t -> color_dialog_button_t

val new_ : Color_dialog.color_dialog_t option -> color_dialog_button_t
