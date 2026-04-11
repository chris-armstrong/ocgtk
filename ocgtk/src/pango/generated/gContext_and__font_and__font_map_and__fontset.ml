(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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
    method get_metrics : Font_description.t option -> Language.t option -> Font_metrics.t
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
    method load_fontset : context_t -> Font_description.t -> Language.t -> fontset_t option
    method reload_font : font_t -> float -> context_t option -> string option -> font_t
    method item_type : int
    method n_items : int
    method as_font_map : Context_and__font_and__font_map_and__fontset.Font_map.t
end

and fontset_t = object
    method get_font : int -> font_t
    method get_metrics : unit -> Font_metrics.t
    method as_fontset : Context_and__font_and__font_map_and__fontset.Fontset.t
end


class context (obj : Context_and__font_and__font_map_and__fontset.Context.t) : context_t = object (self)

  method changed : unit -> unit =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.changed obj)

  method get_base_dir : unit -> Pango_enums.direction =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_base_dir obj)

  method get_base_gravity : unit -> Pango_enums.gravity =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_base_gravity obj)

  method get_font_description : unit -> Font_description.t option =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_font_description obj)

  method get_font_map : unit -> font_map_t option =
    fun () ->
      Option.map (fun ret -> new font_map ret) (Context_and__font_and__font_map_and__fontset.Context.get_font_map obj)

  method get_gravity : unit -> Pango_enums.gravity =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_gravity obj)

  method get_gravity_hint : unit -> Pango_enums.gravityhint =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_gravity_hint obj)

  method get_language : unit -> Language.t =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_language obj)

  method get_matrix : unit -> Matrix.t option =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_matrix obj)

  method get_metrics : Font_description.t option -> Language.t option -> Font_metrics.t =
    fun desc language ->
      (Context_and__font_and__font_map_and__fontset.Context.get_metrics obj desc language)

  method get_round_glyph_positions : unit -> bool =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_round_glyph_positions obj)

  method get_serial : unit -> int =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Context.get_serial obj)

  method load_font : Font_description.t -> font_t option =
    fun desc ->
      Option.map (fun ret -> new font ret) (Context_and__font_and__font_map_and__fontset.Context.load_font obj desc)

  method load_fontset : Font_description.t -> Language.t -> fontset_t option =
    fun desc language ->
      Option.map (fun ret -> new fontset ret) (Context_and__font_and__font_map_and__fontset.Context.load_fontset obj desc language)

  method set_base_dir : Pango_enums.direction -> unit =
    fun direction ->
      (Context_and__font_and__font_map_and__fontset.Context.set_base_dir obj direction)

  method set_base_gravity : Pango_enums.gravity -> unit =
    fun gravity ->
      (Context_and__font_and__font_map_and__fontset.Context.set_base_gravity obj gravity)

  method set_font_description : Font_description.t option -> unit =
    fun desc ->
      (Context_and__font_and__font_map_and__fontset.Context.set_font_description obj desc)

  method set_font_map : font_map_t option -> unit =
    fun font_map ->
      let font_map = Option.map (fun (c) -> c#as_font_map) font_map in
      (Context_and__font_and__font_map_and__fontset.Context.set_font_map obj font_map)

  method set_gravity_hint : Pango_enums.gravityhint -> unit =
    fun hint ->
      (Context_and__font_and__font_map_and__fontset.Context.set_gravity_hint obj hint)

  method set_language : Language.t option -> unit =
    fun language ->
      (Context_and__font_and__font_map_and__fontset.Context.set_language obj language)

  method set_matrix : Matrix.t option -> unit =
    fun matrix ->
      (Context_and__font_and__font_map_and__fontset.Context.set_matrix obj matrix)

  method set_round_glyph_positions : bool -> unit =
    fun round_positions ->
      (Context_and__font_and__font_map_and__fontset.Context.set_round_glyph_positions obj round_positions)

    method as_context = obj
end

and font (obj : Context_and__font_and__font_map_and__fontset.Font.t) : font_t = object (self)

  method describe : unit -> Font_description.t =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Font.describe obj)

  method describe_with_absolute_size : unit -> Font_description.t =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Font.describe_with_absolute_size obj)

  method get_coverage : Language.t -> GCoverage.coverage_t =
    fun language ->
      new  GCoverage.coverage(Context_and__font_and__font_map_and__fontset.Font.get_coverage obj language)

  method get_face : unit -> GFont_face_and__font_family.font_face_t =
    fun () ->
      new  GFont_face_and__font_family.font_face(Context_and__font_and__font_map_and__fontset.Font.get_face obj)

  method get_font_map : unit -> font_map_t option =
    fun () ->
      Option.map (fun ret -> new font_map ret) (Context_and__font_and__font_map_and__fontset.Font.get_font_map obj)

  method get_metrics : Language.t option -> Font_metrics.t =
    fun language ->
      (Context_and__font_and__font_map_and__fontset.Font.get_metrics obj language)

  method has_char : int -> bool =
    fun wc ->
      (Context_and__font_and__font_map_and__fontset.Font.has_char obj wc)

  method serialize : unit -> Glib_bytes.t =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Font.serialize obj)

    method as_font = obj
end

and font_map (obj : Context_and__font_and__font_map_and__fontset.Font_map.t) : font_map_t = object (self)
  inherit Ocgtk_gio.Gio.List_model.list_model (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)

  method changed : unit -> unit =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Font_map.changed obj)

  method create_context : unit -> context_t =
    fun () ->
      new  context(Context_and__font_and__font_map_and__fontset.Font_map.create_context obj)

  method get_family : string -> GFont_face_and__font_family.font_family_t =
    fun name ->
      new  GFont_face_and__font_family.font_family(Context_and__font_and__font_map_and__fontset.Font_map.get_family obj name)

  method get_serial : unit -> int =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Font_map.get_serial obj)

  method load_font : context_t -> Font_description.t -> font_t option =
    fun context desc ->
      let context = context#as_context in
      Option.map (fun ret -> new font ret) (Context_and__font_and__font_map_and__fontset.Font_map.load_font obj context desc)

  method load_fontset : context_t -> Font_description.t -> Language.t -> fontset_t option =
    fun context desc language ->
      let context = context#as_context in
      Option.map (fun ret -> new fontset ret) (Context_and__font_and__font_map_and__fontset.Font_map.load_fontset obj context desc language)

  method reload_font : font_t -> float -> context_t option -> string option -> font_t =
    fun font scale context variations ->
      let font = font#as_font in
      let context = Option.map (fun (c) -> c#as_context) context in
      new  font(Context_and__font_and__font_map_and__fontset.Font_map.reload_font obj font scale context variations)

  method item_type = Context_and__font_and__font_map_and__fontset.Font_map.get_item_type obj

  method n_items = Context_and__font_and__font_map_and__fontset.Font_map.get_n_items obj

    method as_font_map = obj
end

and fontset (obj : Context_and__font_and__font_map_and__fontset.Fontset.t) : fontset_t = object (self)

  method get_font : int -> font_t =
    fun wc ->
      new  font(Context_and__font_and__font_map_and__fontset.Fontset.get_font obj wc)

  method get_metrics : unit -> Font_metrics.t =
    fun () ->
      (Context_and__font_and__font_map_and__fontset.Fontset.get_metrics obj)

    method as_fontset = obj
end
let new_ () : context_t =
  new context (Context_and__font_and__font_map_and__fontset.Context.new_ ())

