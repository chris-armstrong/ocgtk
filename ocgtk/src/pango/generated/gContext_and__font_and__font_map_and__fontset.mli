
class context : Context_and__font_and__font_map_and__fontset.Context.t ->
  object
    method changed : unit -> unit
    method get_base_dir : unit -> Pango_enums.direction
    method get_base_gravity : unit -> Pango_enums.gravity
    method get_font_description : unit -> Font_description.t option
    method get_font_map : unit -> font_map option
    method get_gravity : unit -> Pango_enums.gravity
    method get_gravity_hint : unit -> Pango_enums.gravityhint
    method get_language : unit -> Language.t
    method get_matrix : unit -> Matrix.t option
    method get_metrics : Font_description.t option -> Language.t option -> Font_metrics.t
    method get_round_glyph_positions : unit -> bool
    method get_serial : unit -> int
    method load_font : Font_description.t -> font option
    method load_fontset : Font_description.t -> Language.t -> fontset option
    method set_base_dir : Pango_enums.direction -> unit
    method set_base_gravity : Pango_enums.gravity -> unit
    method set_font_description : Font_description.t option -> unit
    method set_font_map : <as_font_map: Context_and__font_and__font_map_and__fontset.Font_map.t; ..> option -> unit
    method set_gravity_hint : Pango_enums.gravityhint -> unit
    method set_language : Language.t option -> unit
    method set_matrix : Matrix.t option -> unit
    method set_round_glyph_positions : bool -> unit
    method as_context : Context_and__font_and__font_map_and__fontset.Context.t
  end

and font : Context_and__font_and__font_map_and__fontset.Font.t ->
  object
    method describe : unit -> Font_description.t
    method describe_with_absolute_size : unit -> Font_description.t
    method get_coverage : Language.t -> GCoverage.coverage
    method get_face : unit -> GFont_face_and__font_family.font_face
    method get_font_map : unit -> font_map option
    method get_metrics : Language.t option -> Font_metrics.t
    method as_font : Context_and__font_and__font_map_and__fontset.Font.t
  end

and font_map : Context_and__font_and__font_map_and__fontset.Font_map.t ->
  object
    method changed : unit -> unit
    method create_context : unit -> context
    method get_family : string -> GFont_face_and__font_family.font_family
    method get_serial : unit -> int
    method load_font : <as_context: Context_and__font_and__font_map_and__fontset.Context.t; ..> -> Font_description.t -> font option
    method load_fontset : <as_context: Context_and__font_and__font_map_and__fontset.Context.t; ..> -> Font_description.t -> Language.t -> fontset option
    method reload_font : <as_font: Context_and__font_and__font_map_and__fontset.Font.t; ..> -> float -> <as_context: Context_and__font_and__font_map_and__fontset.Context.t; ..> option -> string option -> font
    method n_items : int
    method as_font_map : Context_and__font_and__font_map_and__fontset.Font_map.t
  end

and fontset : Context_and__font_and__font_map_and__fontset.Fontset.t ->
  object
    method get_font : int -> font
    method get_metrics : unit -> Font_metrics.t
    method as_fontset : Context_and__font_and__font_map_and__fontset.Fontset.t
  end
