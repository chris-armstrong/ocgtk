class type video_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_autoplay : unit -> bool
  method get_file : unit -> Ocgio.File.file_t option
  method get_graphics_offload : unit -> Enums.graphicsoffloadenabled
  method get_loop : unit -> bool
  method get_media_stream : unit -> Media_stream.media_stream_t option
  method set_autoplay : bool -> unit
  method set_file : Ocgio.File.file_t option -> unit
  method set_filename : string option -> unit
  method set_graphics_offload : Enums.graphicsoffloadenabled -> unit
  method set_loop : bool -> unit
  method set_media_stream : Media_stream.media_stream_t option -> unit
  method set_resource : string option -> unit
  method as_video : Raw.Video.t
end

(* High-level class for Video *)
class video (obj : Raw.Video.t) : video_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

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
