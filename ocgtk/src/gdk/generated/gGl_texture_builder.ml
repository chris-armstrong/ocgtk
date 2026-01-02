(* High-level class for GLTextureBuilder *)
class gl_texture_builder (obj : Gl_texture_builder.t) = object (self)

  method get_context : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.gl_context option =
    fun () ->
      Option.map (fun ret -> new GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.gl_context ret) (Gl_texture_builder.get_context obj)

  method get_format : unit -> Gdk_enums.memoryformat =
    fun () ->
      (Gl_texture_builder.get_format obj)

  method get_has_mipmap : unit -> bool =
    fun () ->
      (Gl_texture_builder.get_has_mipmap obj)

  method get_height : unit -> int =
    fun () ->
      (Gl_texture_builder.get_height obj)

  method get_id : unit -> int =
    fun () ->
      (Gl_texture_builder.get_id obj)

  method get_update_texture : unit -> GTexture.texture option =
    fun () ->
      Option.map (fun ret -> new GTexture.texture ret) (Gl_texture_builder.get_update_texture obj)

  method get_width : unit -> int =
    fun () ->
      (Gl_texture_builder.get_width obj)

  method set_context : 'p1. (#GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.gl_context as 'p1) option -> unit =
    fun context ->
      let context = Option.map (fun (c) -> c#as_gl_context) context in
      (Gl_texture_builder.set_context obj context)

  method set_format : Gdk_enums.memoryformat -> unit =
    fun format ->
      (Gl_texture_builder.set_format obj format)

  method set_has_mipmap : bool -> unit =
    fun has_mipmap ->
      (Gl_texture_builder.set_has_mipmap obj has_mipmap)

  method set_height : int -> unit =
    fun height ->
      (Gl_texture_builder.set_height obj height)

  method set_id : int -> unit =
    fun id ->
      (Gl_texture_builder.set_id obj id)

  method set_update_texture : 'p1. (#GTexture.texture as 'p1) option -> unit =
    fun texture ->
      let texture = Option.map (fun (c) -> c#as_texture) texture in
      (Gl_texture_builder.set_update_texture obj texture)

  method set_width : int -> unit =
    fun width ->
      (Gl_texture_builder.set_width obj width)

    method as_gl_texture_builder = obj
end

