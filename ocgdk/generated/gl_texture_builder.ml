class type gl_texture_builder_t = object
  method get_color_state : unit -> Raw.Color_state.t

  method get_context :
    unit -> App_launch_context_cycle_de440b34.gl_context_t option

  method get_format : unit -> Enums.memoryformat
  method get_has_mipmap : unit -> bool
  method get_height : unit -> int
  method get_id : unit -> int
  method get_update_region : unit -> Occairo.Region.region_t option
  method get_update_texture : unit -> Texture.texture_t option
  method get_width : unit -> int
  method set_color_state : Raw.Color_state.t -> unit

  method set_context :
    App_launch_context_cycle_de440b34.gl_context_t option -> unit

  method set_format : Enums.memoryformat -> unit
  method set_has_mipmap : bool -> unit
  method set_height : int -> unit
  method set_id : int -> unit
  method set_update_region : Occairo.Region.region_t option -> unit
  method set_update_texture : Texture.texture_t option -> unit
  method set_width : int -> unit
  method as_gl_texture_builder : Raw.Gl_texture_builder.t
end

(* High-level class for GLTextureBuilder *)
class gl_texture_builder (obj : Raw.Gl_texture_builder.t) : gl_texture_builder_t
  =
  object (self)
    method get_color_state : unit -> Raw.Color_state.t =
      fun () -> Raw.Gl_texture_builder.get_color_state obj

    method get_context :
        unit -> App_launch_context_cycle_de440b34.gl_context_t option =
      fun () ->
        Option.map
          (fun ret -> new App_launch_context_cycle_de440b34.gl_context ret)
          (Raw.Gl_texture_builder.get_context obj)

    method get_format : unit -> Enums.memoryformat =
      fun () -> Raw.Gl_texture_builder.get_format obj

    method get_has_mipmap : unit -> bool =
      fun () -> Raw.Gl_texture_builder.get_has_mipmap obj

    method get_height : unit -> int =
      fun () -> Raw.Gl_texture_builder.get_height obj

    method get_id : unit -> int = fun () -> Raw.Gl_texture_builder.get_id obj

    method get_update_region : unit -> Occairo.Region.region_t option =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Region.region ret)
          (Raw.Gl_texture_builder.get_update_region obj)

    method get_update_texture : unit -> Texture.texture_t option =
      fun () ->
        Option.map
          (fun ret -> new Texture.texture ret)
          (Raw.Gl_texture_builder.get_update_texture obj)

    method get_width : unit -> int =
      fun () -> Raw.Gl_texture_builder.get_width obj

    method set_color_state : Raw.Color_state.t -> unit =
      fun color_state -> Raw.Gl_texture_builder.set_color_state obj color_state

    method set_context :
        App_launch_context_cycle_de440b34.gl_context_t option -> unit =
      fun context ->
        let context = Option.map (fun c -> c#as_gl_context) context in
        Raw.Gl_texture_builder.set_context obj context

    method set_format : Enums.memoryformat -> unit =
      fun format -> Raw.Gl_texture_builder.set_format obj format

    method set_has_mipmap : bool -> unit =
      fun has_mipmap -> Raw.Gl_texture_builder.set_has_mipmap obj has_mipmap

    method set_height : int -> unit =
      fun height -> Raw.Gl_texture_builder.set_height obj height

    method set_id : int -> unit = fun id -> Raw.Gl_texture_builder.set_id obj id

    method set_update_region : Occairo.Region.region_t option -> unit =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Raw.Gl_texture_builder.set_update_region obj region

    method set_update_texture : Texture.texture_t option -> unit =
      fun texture ->
        let texture = Option.map (fun c -> c#as_texture) texture in
        Raw.Gl_texture_builder.set_update_texture obj texture

    method set_width : int -> unit =
      fun width -> Raw.Gl_texture_builder.set_width obj width

    method as_gl_texture_builder = obj
  end

let new_ () : gl_texture_builder_t =
  new gl_texture_builder (Raw.Gl_texture_builder.new_ ())
