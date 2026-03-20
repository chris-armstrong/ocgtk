class type color_chooser_t = object
    inherit Gcolor_chooser_signals.color_chooser_signals
    method add_palette : Gtk_enums.orientation -> int -> int -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array option -> unit
    method get_use_alpha : unit -> bool
    method set_rgba : Ocgtk_gdk.Gdk.rgb_a_t -> unit
    method set_use_alpha : bool -> unit
    method as_color_chooser : Color_chooser.t
end

class color_chooser : Color_chooser.t -> color_chooser_t

