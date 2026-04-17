class type context_t = object
  method changed : unit -> unit
  method get_base_dir : unit -> Pango_enums.direction
  method get_base_gravity : unit -> Pango_enums.gravity
  method get_font_description : unit -> Font_description.t option
  method get_font_map : unit -> font_map_t option
  method get_gravity : unit -> Pango_enums.gravity
  method get_gravity_hint : unit -> Pango_enums.gravityhint
  method get_language : unit -> Language.t
  method get_matrix : unit -> Matrix.t option

  method get_metrics :
    Font_description.t option -> Language.t option -> Font_metrics.t

  method get_round_glyph_positions : unit -> bool
  method get_serial : unit -> int
  method load_font : Font_description.t -> font_t option
  method load_fontset : Font_description.t -> Language.t -> fontset_t option
  method set_base_dir : Pango_enums.direction -> unit
  method set_base_gravity : Pango_enums.gravity -> unit
  method set_font_description : Font_description.t option -> unit
  method set_font_map : font_map_t option -> unit
  method set_gravity_hint : Pango_enums.gravityhint -> unit
  method set_language : Language.t option -> unit
  method set_matrix : Matrix.t option -> unit
  method set_round_glyph_positions : bool -> unit
  method as_context : Context_and__font_and__font_map_and__fontset.Context.t
end

and font_t = object
  method describe : unit -> Font_description.t
  method describe_with_absolute_size : unit -> Font_description.t
  method get_coverage : Language.t -> GCoverage.coverage_t
  method get_face : unit -> GFont_face_and__font_family.font_face_t
  method get_font_map : unit -> font_map_t option
  method get_metrics : Language.t option -> Font_metrics.t
  method has_char : int -> bool
  method serialize : unit -> Glib_bytes.t
  method as_font : Context_and__font_and__font_map_and__fontset.Font.t
end

and font_map_t = object
  inherit Ocgtk_gio.Gio.List_model.list_model_t
  method changed : unit -> unit
  method create_context : unit -> context_t
  method get_family : string -> GFont_face_and__font_family.font_family_t
  method get_serial : unit -> int
  method load_font : context_t -> Font_description.t -> font_t option

  method load_fontset :
    context_t -> Font_description.t -> Language.t -> fontset_t option

  method reload_font :
    font_t -> float -> context_t option -> string option -> font_t

  method item_type : int
  method n_items : int
  method as_font_map : Context_and__font_and__font_map_and__fontset.Font_map.t
end

and fontset_t = object
  method get_font : int -> font_t
  method get_metrics : unit -> Font_metrics.t
  method as_fontset : Context_and__font_and__font_map_and__fontset.Fontset.t
end

class context :
  Context_and__font_and__font_map_and__fontset.Context.t ->
  context_t

and font : Context_and__font_and__font_map_and__fontset.Font.t -> font_t

and font_map :
  Context_and__font_and__font_map_and__fontset.Font_map.t ->
  font_map_t

and fontset :
  Context_and__font_and__font_map_and__fontset.Fontset.t ->
  fontset_t

val new_ : unit -> context_t
