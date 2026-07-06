class type memory_texture_builder_t = object
  method build : unit -> GTexture.texture_t
  method get_bytes : unit -> Glib_bytes.t option
  method get_color_state : unit -> Cicp_params_and__color_state.Color_state.t
  method get_format : unit -> Gdk_enums.memoryformat
  method get_height : unit -> int
  method get_offset : int -> Gsize.t
  method get_stride : unit -> Gsize.t
  method get_stride_for_plane : int -> Gsize.t
  method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
  method get_update_texture : unit -> GTexture.texture_t option
  method get_width : unit -> int
  method set_bytes : Glib_bytes.t option -> unit
  method set_color_state : Cicp_params_and__color_state.Color_state.t -> unit
  method set_format : Gdk_enums.memoryformat -> unit
  method set_height : int -> unit
  method set_offset : int -> Gsize.t -> unit
  method set_stride : Gsize.t -> unit
  method set_stride_for_plane : int -> Gsize.t -> unit
  method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
  method set_update_texture : GTexture.texture_t option -> unit
  method set_width : int -> unit
  method as_memory_texture_builder : Memory_texture_builder.t
end

(* High-level class for MemoryTextureBuilder *)
class memory_texture_builder (obj : Memory_texture_builder.t) :
  memory_texture_builder_t =
  object (self)
    method build : unit -> GTexture.texture_t =
      fun () -> new GTexture.texture (Memory_texture_builder.build obj)

    method get_bytes : unit -> Glib_bytes.t option =
      fun () -> Memory_texture_builder.get_bytes obj

    method get_color_state : unit -> Cicp_params_and__color_state.Color_state.t
        =
      fun () -> Memory_texture_builder.get_color_state obj

    method get_format : unit -> Gdk_enums.memoryformat =
      fun () -> Memory_texture_builder.get_format obj

    method get_height : unit -> int =
      fun () -> Memory_texture_builder.get_height obj

    method get_offset : int -> Gsize.t =
      fun plane -> Memory_texture_builder.get_offset obj plane

    method get_stride : unit -> Gsize.t =
      fun () -> Memory_texture_builder.get_stride obj

    method get_stride_for_plane : int -> Gsize.t =
      fun plane -> Memory_texture_builder.get_stride_for_plane obj plane

    method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_cairo.Cairo.Region.region ret)
          (Memory_texture_builder.get_update_region obj)

    method get_update_texture : unit -> GTexture.texture_t option =
      fun () ->
        Option.map
          (fun ret -> new GTexture.texture ret)
          (Memory_texture_builder.get_update_texture obj)

    method get_width : unit -> int =
      fun () -> Memory_texture_builder.get_width obj

    method set_bytes : Glib_bytes.t option -> unit =
      fun bytes -> Memory_texture_builder.set_bytes obj bytes

    method set_color_state : Cicp_params_and__color_state.Color_state.t -> unit
        =
      fun color_state -> Memory_texture_builder.set_color_state obj color_state

    method set_format : Gdk_enums.memoryformat -> unit =
      fun format -> Memory_texture_builder.set_format obj format

    method set_height : int -> unit =
      fun height -> Memory_texture_builder.set_height obj height

    method set_offset : int -> Gsize.t -> unit =
      fun plane offset -> Memory_texture_builder.set_offset obj plane offset

    method set_stride : Gsize.t -> unit =
      fun stride -> Memory_texture_builder.set_stride obj stride

    method set_stride_for_plane : int -> Gsize.t -> unit =
      fun plane stride ->
        Memory_texture_builder.set_stride_for_plane obj plane stride

    method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
        =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Memory_texture_builder.set_update_region obj region

    method set_update_texture : GTexture.texture_t option -> unit =
      fun texture ->
        let texture = Option.map (fun c -> c#as_texture) texture in
        Memory_texture_builder.set_update_texture obj texture

    method set_width : int -> unit =
      fun width -> Memory_texture_builder.set_width obj width

    method as_memory_texture_builder = obj
  end

let new_ () : memory_texture_builder_t =
  new memory_texture_builder (Memory_texture_builder.new_ ())
