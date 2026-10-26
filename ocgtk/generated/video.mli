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

class video : Raw.Video.t -> video_t

val new_ : unit -> video_t
val new_for_file : Ocgio.File.file_t option -> video_t
val new_for_filename : string option -> video_t
val new_for_media_stream : Media_stream.media_stream_t option -> video_t
val new_for_resource : string option -> video_t
