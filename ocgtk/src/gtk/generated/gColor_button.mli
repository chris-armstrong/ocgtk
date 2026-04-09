class type color_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GColor_chooser.color_chooser_t
    inherit Gcolor_button_signals.color_button_signals
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_modal : bool -> unit
    method set_title : string -> unit
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_button : Color_button.t
end

class color_button : Color_button.t -> color_button_t

val new_ : unit -> color_button_t
val new_with_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> color_button_t
