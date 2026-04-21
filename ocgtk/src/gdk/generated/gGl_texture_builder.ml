class type gl_texture_builder_t = object
  method get_context :
    unit -> GApp_launch_context_cycle_de440b34.gl_context_t option

  method get_format : unit -> Gdk_enums.memoryformat
  method get_has_mipmap : unit -> bool
  method get_height : unit -> int
  method get_id : unit -> int
  method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
  method get_update_texture : unit -> GTexture.texture_t option
  method get_width : unit -> int

  method set_context :
    GApp_launch_context_cycle_de440b34.gl_context_t option -> unit

  method set_format : Gdk_enums.memoryformat -> unit
  method set_has_mipmap : bool -> unit
  method set_height : int -> unit
  method set_id : int -> unit
  method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
  method set_update_texture : GTexture.texture_t option -> unit
  method set_width : int -> unit
  method as_gl_texture_builder : Gl_texture_builder.t
end

(* High-level class for GLTextureBuilder *)
class gl_texture_builder (obj : Gl_texture_builder.t) : gl_texture_builder_t =
  object (self)
    method get_context :
        unit -> GApp_launch_context_cycle_de440b34.gl_context_t option =
      fun () ->
        Option.map
          (fun ret -> new GApp_launch_context_cycle_de440b34.gl_context ret)
          (Gl_texture_builder.get_context obj)

    method get_format : unit -> Gdk_enums.memoryformat =
      fun () -> Gl_texture_builder.get_format obj

    method get_has_mipmap : unit -> bool =
      fun () -> Gl_texture_builder.get_has_mipmap obj

    method get_height : unit -> int =
      fun () -> Gl_texture_builder.get_height obj

    method get_id : unit -> int = fun () -> Gl_texture_builder.get_id obj

    method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_cairo.Cairo.Region.region ret)
          (Gl_texture_builder.get_update_region obj)

    method get_update_texture : unit -> GTexture.texture_t option =
      fun () ->
        Option.map
          (fun ret -> new GTexture.texture ret)
          (Gl_texture_builder.get_update_texture obj)

    method get_width : unit -> int = fun () -> Gl_texture_builder.get_width obj

    method set_context :
        GApp_launch_context_cycle_de440b34.gl_context_t option -> unit =
      fun context ->
        let context = Option.map (fun c -> c#as_gl_context) context in
        Gl_texture_builder.set_context obj context

    method set_format : Gdk_enums.memoryformat -> unit =
      fun format -> Gl_texture_builder.set_format obj format

    method set_has_mipmap : bool -> unit =
      fun has_mipmap -> Gl_texture_builder.set_has_mipmap obj has_mipmap

    method set_height : int -> unit =
      fun height -> Gl_texture_builder.set_height obj height

    method set_id : int -> unit = fun id -> Gl_texture_builder.set_id obj id

    method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
        =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Gl_texture_builder.set_update_region obj region

    method set_update_texture : GTexture.texture_t option -> unit =
      fun texture ->
        let texture = Option.map (fun c -> c#as_texture) texture in
        Gl_texture_builder.set_update_texture obj texture

    method set_width : int -> unit =
      fun width -> Gl_texture_builder.set_width obj width

    method as_gl_texture_builder = obj
  end

let new_ () : gl_texture_builder_t =
  new gl_texture_builder (Gl_texture_builder.new_ ())
