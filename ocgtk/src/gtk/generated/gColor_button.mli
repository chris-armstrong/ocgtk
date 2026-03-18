class color_button : Color_button.t ->
  object
    inherit Gcolor_button_signals.color_button_signals
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_modal : bool -> unit
    method set_title : string -> unit
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_button : Color_button.t
  end

