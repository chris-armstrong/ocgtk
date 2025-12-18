class color_chooser : Color_chooser.t ->
  object
    inherit Gcolor_chooser_signals.color_chooser_signals
    method use_alpha : bool
    method set_use_alpha : bool -> unit
    method as_color_chooser : Color_chooser.t
  end

