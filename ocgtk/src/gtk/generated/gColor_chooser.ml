class type color_chooser_t = object
  method on_color_activated :
    ?after:bool ->
    callback:(color:Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

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
    method on_color_activated ?(after = false) ~callback () =
      Color_chooser.on_color_activated ~after self#as_color_chooser
        ~callback:(fun ~color ->
          callback ~color:(new Ocgtk_gdk.Gdk.Rgb_a.rgb_a color))

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
