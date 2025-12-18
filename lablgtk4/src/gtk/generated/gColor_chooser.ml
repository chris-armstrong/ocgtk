(* Signal class defined in gcolor_chooser_signals.ml *)

(* High-level class for ColorChooser *)
class color_chooser (obj : Color_chooser.t) = object (self)
  inherit Gcolor_chooser_signals.color_chooser_signals obj

  method use_alpha = Color_chooser.get_use_alpha obj
  method set_use_alpha v = Color_chooser.set_use_alpha obj v

    method as_color_chooser = obj
end

