(* Signal class defined in gcolor_chooser_signals.ml *)

class type color_chooser_t = object
  inherit Gcolor_chooser_signals.color_chooser_signals

  method add_palette :
    Gtk_enums.orientation ->
    int ->
    int ->
    Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array option ->
    unit

  method get_use_alpha : unit -> bool
  method set_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method set_use_alpha : bool -> unit
  method as_color_chooser : Color_chooser.t
end

(* High-level class for ColorChooser *)
class color_chooser (obj : Color_chooser.t) : color_chooser_t =
  object (self)
    inherit Gcolor_chooser_signals.color_chooser_signals obj

    method add_palette :
        Gtk_enums.orientation ->
        int ->
        int ->
        Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array option ->
        unit =
      fun orientation colors_per_line n_colors colors ->
        Color_chooser.add_palette obj orientation colors_per_line n_colors
          colors

    method get_use_alpha : unit -> bool =
      fun () -> Color_chooser.get_use_alpha obj

    method set_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
      fun color ->
        let color = color#as_rgb_a in
        Color_chooser.set_rgba obj color

    method set_use_alpha : bool -> unit =
      fun use_alpha -> Color_chooser.set_use_alpha obj use_alpha

    method as_color_chooser = obj
  end
