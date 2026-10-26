class type context_t = object
  method changed : unit -> unit
  method get_base_dir : unit -> Enums.direction
  method get_base_gravity : unit -> Enums.gravity
  method get_font_description : unit -> Raw.Font_description.t option
  method get_font_map : unit -> font_map_t option
  method get_gravity : unit -> Enums.gravity
  method get_gravity_hint : unit -> Enums.gravityhint
  method get_language : unit -> Raw.Language.t
  method get_matrix : unit -> Raw.Matrix.t option

  method get_metrics :
    Raw.Font_description.t option -> Raw.Language.t option -> Raw.Font_metrics.t

  method get_round_glyph_positions : unit -> bool
  method get_serial : unit -> int
  method load_font : Raw.Font_description.t -> font_t option

  method load_fontset :
    Raw.Font_description.t -> Raw.Language.t -> fontset_t option

  method set_base_dir : Enums.direction -> unit
  method set_base_gravity : Enums.gravity -> unit
  method set_font_description : Raw.Font_description.t -> unit
  method set_font_map : font_map_t option -> unit
  method set_gravity_hint : Enums.gravityhint -> unit
  method set_language : Raw.Language.t option -> unit
  method set_matrix : Raw.Matrix.t option -> unit
  method set_round_glyph_positions : bool -> unit
  method as_context : Raw.Context.t
end

and font_t = object
  method describe : unit -> Raw.Font_description.t
  method describe_with_absolute_size : unit -> Raw.Font_description.t
  method get_coverage : Raw.Language.t -> Coverage.coverage_t
  method get_face : unit -> Font_face_and__font_family.font_face_t option
  method get_font_map : unit -> font_map_t option
  method get_metrics : Raw.Language.t option -> Raw.Font_metrics.t
  method has_char : int -> bool
  method serialize : unit -> Glib_bytes.t
  method as_font : Raw.Font.t
end

and font_map_t = object
  inherit Ocgio.List_model.list_model_t
  method add_font_file : string -> (bool, GError.t) result
  method changed : unit -> unit
  method create_context : unit -> context_t
  method get_family : string -> Font_face_and__font_family.font_family_t option
  method get_serial : unit -> int
  method load_font : context_t -> Raw.Font_description.t -> font_t option

  method load_fontset :
    context_t -> Raw.Font_description.t -> Raw.Language.t -> fontset_t option

  method reload_font :
    font_t -> float -> context_t option -> string option -> font_t

  method item_type : Gobject.Type.t
  method n_items : int
  method as_font_map : Raw.Font_map.t
end

and fontset_t = object
  method get_font : int -> font_t
  method get_metrics : unit -> Raw.Font_metrics.t
  method as_fontset : Raw.Fontset.t
end

class context : Raw.Context.t -> context_t

and font : Raw.Font.t -> font_t

and font_map : Raw.Font_map.t -> font_map_t

and fontset : Raw.Fontset.t -> fontset_t

val new_ : unit -> context_t
