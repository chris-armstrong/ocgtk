class color_chooser : Color_chooser.t ->
  object
    inherit Gcolor_chooser_signals.color_chooser_signals
    method get_use_alpha : unit -> bool
    method set_use_alpha : bool -> unit
    method as_color_chooser : Color_chooser.t
  end

