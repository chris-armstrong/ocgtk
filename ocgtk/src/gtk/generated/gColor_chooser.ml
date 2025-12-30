(* Signal class defined in gcolor_chooser_signals.ml *)

(* High-level class for ColorChooser *)
class color_chooser (obj : Color_chooser.t) = object (self)
  inherit Gcolor_chooser_signals.color_chooser_signals obj

  method get_use_alpha : unit -> bool =
    fun () ->
      (Color_chooser.get_use_alpha obj)

  method set_use_alpha : bool -> unit =
    fun use_alpha ->
      (Color_chooser.set_use_alpha obj use_alpha)

    method as_color_chooser = obj
end

