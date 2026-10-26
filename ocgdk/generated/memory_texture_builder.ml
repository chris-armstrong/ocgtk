class type memory_texture_builder_t = object
  method build : unit -> Texture.texture_t
  method get_bytes : unit -> Glib_bytes.t option
  method get_color_state : unit -> Raw.Color_state.t
  method get_format : unit -> Enums.memoryformat
  method get_height : unit -> int
  method get_offset : int -> Gsize.t
  method get_stride : unit -> Gsize.t
  method get_stride_for_plane : int -> Gsize.t
  method get_update_region : unit -> Occairo.Region.region_t option
  method get_update_texture : unit -> Texture.texture_t option
  method get_width : unit -> int
  method set_bytes : Glib_bytes.t option -> unit
  method set_color_state : Raw.Color_state.t -> unit
  method set_format : Enums.memoryformat -> unit
  method set_height : int -> unit
  method set_offset : int -> Gsize.t -> unit
  method set_stride : Gsize.t -> unit
  method set_stride_for_plane : int -> Gsize.t -> unit
  method set_update_region : Occairo.Region.region_t option -> unit
  method set_update_texture : Texture.texture_t option -> unit
  method set_width : int -> unit
  method as_memory_texture_builder : Raw.Memory_texture_builder.t
end

(* High-level class for MemoryTextureBuilder *)
class memory_texture_builder (obj : Raw.Memory_texture_builder.t) :
  memory_texture_builder_t =
  object (self)
    method build : unit -> Texture.texture_t =
      fun () -> new Texture.texture (Raw.Memory_texture_builder.build obj)

    method get_bytes : unit -> Glib_bytes.t option =
      fun () -> Raw.Memory_texture_builder.get_bytes obj

    method get_color_state : unit -> Raw.Color_state.t =
      fun () -> Raw.Memory_texture_builder.get_color_state obj

    method get_format : unit -> Enums.memoryformat =
      fun () -> Raw.Memory_texture_builder.get_format obj

    method get_height : unit -> int =
      fun () -> Raw.Memory_texture_builder.get_height obj

    method get_offset : int -> Gsize.t =
      fun plane -> Raw.Memory_texture_builder.get_offset obj plane

    method get_stride : unit -> Gsize.t =
      fun () -> Raw.Memory_texture_builder.get_stride obj

    method get_stride_for_plane : int -> Gsize.t =
      fun plane -> Raw.Memory_texture_builder.get_stride_for_plane obj plane

    method get_update_region : unit -> Occairo.Region.region_t option =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Region.region ret)
          (Raw.Memory_texture_builder.get_update_region obj)

    method get_update_texture : unit -> Texture.texture_t option =
      fun () ->
        Option.map
          (fun ret -> new Texture.texture ret)
          (Raw.Memory_texture_builder.get_update_texture obj)

    method get_width : unit -> int =
      fun () -> Raw.Memory_texture_builder.get_width obj

    method set_bytes : Glib_bytes.t option -> unit =
      fun bytes -> Raw.Memory_texture_builder.set_bytes obj bytes

    method set_color_state : Raw.Color_state.t -> unit =
      fun color_state ->
        Raw.Memory_texture_builder.set_color_state obj color_state

    method set_format : Enums.memoryformat -> unit =
      fun format -> Raw.Memory_texture_builder.set_format obj format

    method set_height : int -> unit =
      fun height -> Raw.Memory_texture_builder.set_height obj height

    method set_offset : int -> Gsize.t -> unit =
      fun plane offset -> Raw.Memory_texture_builder.set_offset obj plane offset

    method set_stride : Gsize.t -> unit =
      fun stride -> Raw.Memory_texture_builder.set_stride obj stride

    method set_stride_for_plane : int -> Gsize.t -> unit =
      fun plane stride ->
        Raw.Memory_texture_builder.set_stride_for_plane obj plane stride

    method set_update_region : Occairo.Region.region_t option -> unit =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Raw.Memory_texture_builder.set_update_region obj region

    method set_update_texture : Texture.texture_t option -> unit =
      fun texture ->
        let texture = Option.map (fun c -> c#as_texture) texture in
        Raw.Memory_texture_builder.set_update_texture obj texture

    method set_width : int -> unit =
      fun width -> Raw.Memory_texture_builder.set_width obj width

    method as_memory_texture_builder = obj
  end

let new_ () : memory_texture_builder_t =
  new memory_texture_builder (Raw.Memory_texture_builder.new_ ())
