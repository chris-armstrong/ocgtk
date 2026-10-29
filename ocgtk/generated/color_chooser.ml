class type color_chooser_t = object
  (** {2:methods Methods} *)

  method add_palette :
    Enums.orientation -> int -> int -> Ocgdk.Raw.Rgb_a.t array option -> unit
  (** Adds a palette to the color chooser.

      If [orientation] is horizontal, the colors are grouped in rows, with
      [colors_per_line] colors in each row. If [horizontal] is [FALSE], the
      colors are grouped in columns instead.

      The default color palette of [Gtk.ColorChooserWidget] has 45 colors,
      organized in columns of 5 colors (this includes some grays).

      The layout of the color chooser widget works best when the palettes have
      9-10 columns.

      Calling this function for the first time has the side effect of removing
      the default color palette from the color chooser.

      If [colors] is [NULL], removes all previously added palettes. *)

  method get_use_alpha : unit -> bool
  (** Returns whether the color chooser shows the alpha channel. *)

  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Sets the color. *)

  method set_use_alpha : bool -> unit
  (** Sets whether or not the color chooser should use the alpha channel. *)

  (** {2:conversions Conversions} *)

  method as_color_chooser : Raw.Color_chooser.t
end

(* High-level class for ColorChooser *)
class color_chooser (obj : Raw.Color_chooser.t) : color_chooser_t =
  object (self)
    method add_palette :
        Enums.orientation ->
        int ->
        int ->
        Ocgdk.Raw.Rgb_a.t array option ->
        unit =
      fun orientation colors_per_line n_colors colors ->
        Raw.Color_chooser.add_palette obj orientation colors_per_line n_colors
          colors

    method get_use_alpha : unit -> bool =
      fun () -> Raw.Color_chooser.get_use_alpha obj

    method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun color ->
        let color = color#as_rgb_a in
        Raw.Color_chooser.set_rgba obj color

    method set_use_alpha : bool -> unit =
      fun use_alpha -> Raw.Color_chooser.set_use_alpha obj use_alpha

    method as_color_chooser = obj
  end
