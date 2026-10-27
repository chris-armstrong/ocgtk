(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class context (obj : Raw.Context.t) : context_t =
  object (self)
    method changed : unit -> unit = fun () -> Raw.Context.changed obj

    method get_base_dir : unit -> Enums.direction =
      fun () -> Raw.Context.get_base_dir obj

    method get_base_gravity : unit -> Enums.gravity =
      fun () -> Raw.Context.get_base_gravity obj

    method get_font_description : unit -> Raw.Font_description.t option =
      fun () -> Raw.Context.get_font_description obj

    method get_font_map : unit -> font_map_t option =
      fun () ->
        Option.map (fun ret -> new font_map ret) (Raw.Context.get_font_map obj)

    method get_gravity : unit -> Enums.gravity =
      fun () -> Raw.Context.get_gravity obj

    method get_gravity_hint : unit -> Enums.gravityhint =
      fun () -> Raw.Context.get_gravity_hint obj

    method get_language : unit -> Raw.Language.t =
      fun () -> Raw.Context.get_language obj

    method get_matrix : unit -> Raw.Matrix.t option =
      fun () -> Raw.Context.get_matrix obj

    method get_metrics :
        Raw.Font_description.t option ->
        Raw.Language.t option ->
        Raw.Font_metrics.t =
      fun desc language -> Raw.Context.get_metrics obj desc language

    method get_round_glyph_positions : unit -> bool =
      fun () -> Raw.Context.get_round_glyph_positions obj

    method get_serial : unit -> int = fun () -> Raw.Context.get_serial obj

    method load_font : Raw.Font_description.t -> font_t option =
      fun desc ->
        Option.map (fun ret -> new font ret) (Raw.Context.load_font obj desc)

    method load_fontset :
        Raw.Font_description.t -> Raw.Language.t -> fontset_t option =
      fun desc language ->
        Option.map
          (fun ret -> new fontset ret)
          (Raw.Context.load_fontset obj desc language)

    method set_base_dir : Enums.direction -> unit =
      fun direction -> Raw.Context.set_base_dir obj direction

    method set_base_gravity : Enums.gravity -> unit =
      fun gravity -> Raw.Context.set_base_gravity obj gravity

    method set_font_description : Raw.Font_description.t -> unit =
      fun desc -> Raw.Context.set_font_description obj desc

    method set_font_map : font_map_t option -> unit =
      fun font_map ->
        let font_map = Option.map (fun c -> c#as_font_map) font_map in
        Raw.Context.set_font_map obj font_map

    method set_gravity_hint : Enums.gravityhint -> unit =
      fun hint -> Raw.Context.set_gravity_hint obj hint

    method set_language : Raw.Language.t option -> unit =
      fun language -> Raw.Context.set_language obj language

    method set_matrix : Raw.Matrix.t option -> unit =
      fun matrix -> Raw.Context.set_matrix obj matrix

    method set_round_glyph_positions : bool -> unit =
      fun round_positions ->
        Raw.Context.set_round_glyph_positions obj round_positions

    method as_context = obj
  end

and font (obj : Raw.Font.t) : font_t =
  object (self)
    method describe : unit -> Raw.Font_description.t =
      fun () -> Raw.Font.describe obj

    method describe_with_absolute_size : unit -> Raw.Font_description.t =
      fun () -> Raw.Font.describe_with_absolute_size obj

    method get_coverage : Raw.Language.t -> Coverage.coverage_t =
      fun language -> new Coverage.coverage (Raw.Font.get_coverage obj language)

    method get_face : unit -> Font_face_and__font_family.font_face_t option =
      fun () ->
        Option.map
          (fun ret -> new Font_face_and__font_family.font_face ret)
          (Raw.Font.get_face obj)

    method get_font_map : unit -> font_map_t option =
      fun () ->
        Option.map (fun ret -> new font_map ret) (Raw.Font.get_font_map obj)

    method get_metrics : Raw.Language.t option -> Raw.Font_metrics.t =
      fun language -> Raw.Font.get_metrics obj language

    method has_char : int -> bool = fun wc -> Raw.Font.has_char obj wc
    method serialize : unit -> Glib_bytes.t = fun () -> Raw.Font.serialize obj
    method as_font = obj
  end

and font_map (obj : Raw.Font_map.t) : font_map_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method add_font_file : string -> (bool, GError.t) result =
      fun filename -> Raw.Font_map.add_font_file obj filename

    method changed : unit -> unit = fun () -> Raw.Font_map.changed obj

    method create_context : unit -> context_t =
      fun () -> new context (Raw.Font_map.create_context obj)

    method get_family :
        string -> Font_face_and__font_family.font_family_t option =
      fun name ->
        Option.map
          (fun ret -> new Font_face_and__font_family.font_family ret)
          (Raw.Font_map.get_family obj name)

    method get_serial : unit -> int = fun () -> Raw.Font_map.get_serial obj

    method load_font : context_t -> Raw.Font_description.t -> font_t option =
      fun context desc ->
        let context = context#as_context in
        Option.map
          (fun ret -> new font ret)
          (Raw.Font_map.load_font obj context desc)

    method load_fontset :
        context_t ->
        Raw.Font_description.t ->
        Raw.Language.t ->
        fontset_t option =
      fun context desc language ->
        let context = context#as_context in
        Option.map
          (fun ret -> new fontset ret)
          (Raw.Font_map.load_fontset obj context desc language)

    method reload_font :
        font_t -> float -> context_t option -> string option -> font_t =
      fun font scale context variations ->
        let font = font#as_font in
        let context = Option.map (fun c -> c#as_context) context in
        new font (Raw.Font_map.reload_font obj font scale context variations)

    method item_type = Raw.Font_map.get_item_type obj
    method n_items = Raw.Font_map.get_n_items obj
    method as_font_map = obj
  end

and fontset (obj : Raw.Fontset.t) : fontset_t =
  object (self)
    method get_font : int -> font_t =
      fun wc -> new font (Raw.Fontset.get_font obj wc)

    method get_metrics : unit -> Raw.Font_metrics.t =
      fun () -> Raw.Fontset.get_metrics obj

    method as_fontset = obj
  end

let new_ () : context_t = new context (Raw.Context.new_ ())
