class type font_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GFont_chooser.font_chooser_t
    inherit Gfont_button_signals.font_button_signals
    method get_modal : unit -> bool
    method get_title : unit -> string
    method get_use_font : unit -> bool
    method get_use_size : unit -> bool
    method set_modal : bool -> unit
    method set_title : string -> unit
    method set_use_font : bool -> unit
    method set_use_size : bool -> unit
    method as_font_button : Font_button.t
end

class font_button : Font_button.t -> font_button_t

val new_ : unit -> font_button_t
val new_with_font : string -> font_button_t
