class type dmabuf_texture_builder_t = object
    method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display_t
    method get_fd : int -> int
    method get_fourcc : unit -> UInt32.t
    method get_height : unit -> int
    method get_modifier : unit -> UInt64.t
    method get_n_planes : unit -> int
    method get_offset : int -> int
    method get_premultiplied : unit -> bool
    method get_stride : int -> int
    method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
    method get_update_texture : unit -> GTexture.texture_t option
    method get_width : unit -> int
    method set_display : GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display_t -> unit
    method set_fd : int -> int -> unit
    method set_fourcc : UInt32.t -> unit
    method set_height : int -> unit
    method set_modifier : UInt64.t -> unit
    method set_n_planes : int -> unit
    method set_offset : int -> int -> unit
    method set_premultiplied : bool -> unit
    method set_stride : int -> int -> unit
    method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
    method set_update_texture : GTexture.texture_t option -> unit
    method set_width : int -> unit
    method as_dmabuf_texture_builder : Dmabuf_texture_builder.t
end

(* High-level class for DmabufTextureBuilder *)
class dmabuf_texture_builder (obj : Dmabuf_texture_builder.t) : dmabuf_texture_builder_t = object (self)

  method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display_t =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display(Dmabuf_texture_builder.get_display obj)

  method get_fd : int -> int =
    fun plane ->
      (Dmabuf_texture_builder.get_fd obj plane)

  method get_fourcc : unit -> UInt32.t =
    fun () ->
      (Dmabuf_texture_builder.get_fourcc obj)

  method get_height : unit -> int =
    fun () ->
      (Dmabuf_texture_builder.get_height obj)

  method get_modifier : unit -> UInt64.t =
    fun () ->
      (Dmabuf_texture_builder.get_modifier obj)

  method get_n_planes : unit -> int =
    fun () ->
      (Dmabuf_texture_builder.get_n_planes obj)

  method get_offset : int -> int =
    fun plane ->
      (Dmabuf_texture_builder.get_offset obj plane)

  method get_premultiplied : unit -> bool =
    fun () ->
      (Dmabuf_texture_builder.get_premultiplied obj)

  method get_stride : int -> int =
    fun plane ->
      (Dmabuf_texture_builder.get_stride obj plane)

  method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_cairo.Cairo.Region.region ret) (Dmabuf_texture_builder.get_update_region obj)

  method get_update_texture : unit -> GTexture.texture_t option =
    fun () ->
      Option.map (fun ret -> new GTexture.texture ret) (Dmabuf_texture_builder.get_update_texture obj)

  method get_width : unit -> int =
    fun () ->
      (Dmabuf_texture_builder.get_width obj)

  method set_display : GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display_t -> unit =
    fun display ->
      let display = display#as_display in
      (Dmabuf_texture_builder.set_display obj display)

  method set_fd : int -> int -> unit =
    fun plane fd ->
      (Dmabuf_texture_builder.set_fd obj plane fd)

  method set_fourcc : UInt32.t -> unit =
    fun fourcc ->
      (Dmabuf_texture_builder.set_fourcc obj fourcc)

  method set_height : int -> unit =
    fun height ->
      (Dmabuf_texture_builder.set_height obj height)

  method set_modifier : UInt64.t -> unit =
    fun modifier ->
      (Dmabuf_texture_builder.set_modifier obj modifier)

  method set_n_planes : int -> unit =
    fun n_planes ->
      (Dmabuf_texture_builder.set_n_planes obj n_planes)

  method set_offset : int -> int -> unit =
    fun plane offset ->
      (Dmabuf_texture_builder.set_offset obj plane offset)

  method set_premultiplied : bool -> unit =
    fun premultiplied ->
      (Dmabuf_texture_builder.set_premultiplied obj premultiplied)

  method set_stride : int -> int -> unit =
    fun plane stride ->
      (Dmabuf_texture_builder.set_stride obj plane stride)

  method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit =
    fun region ->
      let region = Option.map (fun (c) -> c#as_region) region in
      (Dmabuf_texture_builder.set_update_region obj region)

  method set_update_texture : GTexture.texture_t option -> unit =
    fun texture ->
      let texture = Option.map (fun (c) -> c#as_texture) texture in
      (Dmabuf_texture_builder.set_update_texture obj texture)

  method set_width : int -> unit =
    fun width ->
      (Dmabuf_texture_builder.set_width obj width)

    method as_dmabuf_texture_builder = obj
end

let new_ () : dmabuf_texture_builder_t =
  new dmabuf_texture_builder (Dmabuf_texture_builder.new_ ())

