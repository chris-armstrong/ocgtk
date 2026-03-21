class type video_t = object
    method get_autoplay : unit -> bool
    method get_file : unit -> Ocgtk_gio.Gio.file_t option
    method get_graphics_offload : unit -> Gtk_enums.graphicsoffloadenabled
    method get_loop : unit -> bool
    method get_media_stream : unit -> GMedia_stream.media_stream_t option
    method set_autoplay : bool -> unit
    method set_file : Ocgtk_gio.Gio.file_t option -> unit
    method set_filename : string option -> unit
    method set_graphics_offload : Gtk_enums.graphicsoffloadenabled -> unit
    method set_loop : bool -> unit
    method set_media_stream : GMedia_stream.media_stream_t option -> unit
    method set_resource : string option -> unit
    method as_video : Video.t
end

(* High-level class for Video *)
class video (obj : Video.t) : video_t = object (self)

  method get_autoplay : unit -> bool =
    fun () ->
      (Video.get_autoplay obj)

  method get_file : unit -> Ocgtk_gio.Gio.file_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (Video.get_file obj)

  method get_graphics_offload : unit -> Gtk_enums.graphicsoffloadenabled =
    fun () ->
      (Video.get_graphics_offload obj)

  method get_loop : unit -> bool =
    fun () ->
      (Video.get_loop obj)

  method get_media_stream : unit -> GMedia_stream.media_stream_t option =
    fun () ->
      Option.map (fun ret -> new GMedia_stream.media_stream ret) (Video.get_media_stream obj)

  method set_autoplay : bool -> unit =
    fun autoplay ->
      (Video.set_autoplay obj autoplay)

  method set_file : Ocgtk_gio.Gio.file_t option -> unit =
    fun file ->
      let file = Option.map (fun (c) -> c#as_file) file in
      (Video.set_file obj file)

  method set_filename : string option -> unit =
    fun filename ->
      (Video.set_filename obj filename)

  method set_graphics_offload : Gtk_enums.graphicsoffloadenabled -> unit =
    fun enabled ->
      (Video.set_graphics_offload obj enabled)

  method set_loop : bool -> unit =
    fun loop ->
      (Video.set_loop obj loop)

  method set_media_stream : GMedia_stream.media_stream_t option -> unit =
    fun stream ->
      let stream = Option.map (fun (c) -> c#as_media_stream) stream in
      (Video.set_media_stream obj stream)

  method set_resource : string option -> unit =
    fun resource_path ->
      (Video.set_resource obj resource_path)

    method as_video = obj
end

