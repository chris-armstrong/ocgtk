class type font_map_t = object
  method get_font_type : unit -> Occairo.Enums.fonttype
  (** Gets the type of Cairo font backend that [fontmap] uses. *)

  method get_resolution : unit -> float
  (** Gets the resolution for the fontmap.

      See [PangoCairo.FontMap.set_resolution]. *)

  method set_default : unit -> unit
  (** Sets a default [PangoCairoFontMap] to use with Cairo.

      This can be used to change the Cairo font backend that the default fontmap
      uses for example. The old default font map is unreffed and the new font
      map referenced.

      Note that since Pango 1.32.6, the default fontmap is per-thread. This
      function only changes the default fontmap for the current thread. Default
      fontmaps of existing threads are not changed. Default fontmaps of any new
      threads will still be created using [PangoCairo.FontMap.new].

      A value of [NULL] for [fontmap] will cause the current default font map to
      be released and a new default font map to be created on demand, using
      [PangoCairo.FontMap.new]. *)

  method set_resolution : float -> unit
  (** Sets the resolution for the fontmap.

      This is a scale factor between points specified in a
      [PangoFontDescription] and Cairo units. The default value is 96, meaning
      that a 10 point font will be 13 units high. (10 * 96. / 72. = 13.3). *)

  method as_font_map : Raw.Font_map.t
end

(* High-level class for FontMap *)
class font_map (obj : Raw.Font_map.t) : font_map_t =
  object (self)
    method get_font_type : unit -> Occairo.Enums.fonttype =
      fun () -> Raw.Font_map.get_font_type obj

    method get_resolution : unit -> float =
      fun () -> Raw.Font_map.get_resolution obj

    method set_default : unit -> unit = fun () -> Raw.Font_map.set_default obj

    method set_resolution : float -> unit =
      fun dpi -> Raw.Font_map.set_resolution obj dpi

    method as_font_map = obj
  end
