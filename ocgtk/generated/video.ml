class type video_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_autoplay : unit -> bool
  (** Returns [TRUE] if videos have been set to loop. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the file played by [self] or [NULL] if not playing back a file. *)

  method get_graphics_offload : unit -> Enums.graphicsoffloadenabled
  (** Returns whether graphics offload is enabled.

      See [Gtk.GraphicsOffload] for more information on graphics offload. *)

  method get_loop : unit -> bool
  (** Returns [TRUE] if videos have been set to loop. *)

  method get_media_stream : unit -> Media_stream.media_stream_t option
  (** Gets the media stream managed by [self] or [NULL] if none. *)

  method set_autoplay : bool -> unit
  (** Sets whether [self] automatically starts playback when it becomes visible
      or when a new file gets loaded. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Makes [self] play the given [file]. *)

  method set_filename : string option -> unit
  (** Makes [self] play the given [filename].

      This is a utility function that calls gtk_video_set_file(), *)

  method set_graphics_offload : Enums.graphicsoffloadenabled -> unit
  (** Sets whether to enable graphics offload.

      See [Gtk.GraphicsOffload] for more information on graphics offload. *)

  method set_loop : bool -> unit
  (** Sets whether new files loaded by [self] should be set to loop. *)

  method set_media_stream : Media_stream.media_stream_t option -> unit
  (** Sets the media stream to be played back.

      [self] will take full control of managing the media stream. If you want to
      manage a media stream yourself, consider using a [Gtk.Picture] for
      display.

      If you want to display a file, consider using [Gtk.Video.set_file]
      instead. *)

  method set_resource : string option -> unit
  (** Makes [self] play the resource at the given [resource_path].

      This is a utility function that calls [Gtk.Video.set_file]. *)

  (** {2:conversions Conversions} *)

  method as_video : Raw.Video.t
end

(* High-level class for Video *)
class video (obj : Raw.Video.t) : video_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    method get_autoplay : unit -> bool = fun () -> Raw.Video.get_autoplay obj

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map (fun ret -> new Ocgio.File.file ret) (Raw.Video.get_file obj)

    method get_graphics_offload : unit -> Enums.graphicsoffloadenabled =
      fun () -> Raw.Video.get_graphics_offload obj

    method get_loop : unit -> bool = fun () -> Raw.Video.get_loop obj

    method get_media_stream : unit -> Media_stream.media_stream_t option =
      fun () ->
        Option.map
          (fun ret -> new Media_stream.media_stream ret)
          (Raw.Video.get_media_stream obj)

    method set_autoplay : bool -> unit =
      fun autoplay -> Raw.Video.set_autoplay obj autoplay

    method set_file : Ocgio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        Raw.Video.set_file obj file

    method set_filename : string option -> unit =
      fun filename -> Raw.Video.set_filename obj filename

    method set_graphics_offload : Enums.graphicsoffloadenabled -> unit =
      fun enabled -> Raw.Video.set_graphics_offload obj enabled

    method set_loop : bool -> unit = fun loop -> Raw.Video.set_loop obj loop

    method set_media_stream : Media_stream.media_stream_t option -> unit =
      fun stream ->
        let stream = Option.map (fun c -> c#as_media_stream) stream in
        Raw.Video.set_media_stream obj stream

    method set_resource : string option -> unit =
      fun resource_path -> Raw.Video.set_resource obj resource_path

    method as_video = obj
  end

let new_ () : video_t = new video (Raw.Video.new_ ())

let new_for_file (file : Ocgio.File.file_t option) : video_t =
  let file = Option.map (fun c -> c#as_file) file in
  let obj_ = Raw.Video.new_for_file file in
  new video obj_

let new_for_filename (filename : string option) : video_t =
  let obj_ = Raw.Video.new_for_filename filename in
  new video obj_

let new_for_media_stream (stream : Media_stream.media_stream_t option) : video_t
    =
  let stream = Option.map (fun c -> c#as_media_stream) stream in
  let obj_ = Raw.Video.new_for_media_stream stream in
  new video obj_

let new_for_resource (resource_path : string option) : video_t =
  let obj_ = Raw.Video.new_for_resource resource_path in
  new video obj_
