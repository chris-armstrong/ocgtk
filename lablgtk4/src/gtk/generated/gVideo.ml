(* High-level class for Video *)
class video (obj : Video.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Video.as_widget obj)

  method get_autoplay : unit -> bool =
    fun () ->
      (Video.get_autoplay obj)

  method get_graphics_offload : unit -> Gtk_enums.graphicsoffloadenabled =
    fun () ->
      (Video.get_graphics_offload obj)

  method get_loop : unit -> bool =
    fun () ->
      (Video.get_loop obj)

  method get_media_stream : unit -> GMedia_stream.media_stream option =
    fun () ->
      Option.map (fun ret -> new GMedia_stream.media_stream ret) (Video.get_media_stream obj)

  method set_autoplay : bool -> unit =
    fun autoplay ->
      (Video.set_autoplay obj autoplay)

  method set_filename : string option -> unit =
    fun filename ->
      (Video.set_filename obj filename)

  method set_graphics_offload : Gtk_enums.graphicsoffloadenabled -> unit =
    fun enabled ->
      (Video.set_graphics_offload obj enabled)

  method set_loop : bool -> unit =
    fun loop ->
      (Video.set_loop obj loop)

  method set_media_stream : 'p1. (#GMedia_stream.media_stream as 'p1) option -> unit =
    fun stream ->
      let stream = Option.map (fun (c) -> c#as_media_stream) stream in
      (Video.set_media_stream obj stream)

  method set_resource : string option -> unit =
    fun resource_path ->
      (Video.set_resource obj resource_path)

  method as_widget = (Video.as_widget obj)
    method as_video = obj
end

