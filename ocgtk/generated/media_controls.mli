class type media_controls_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_media_stream : unit -> Media_stream.media_stream_t option
  method set_media_stream : Media_stream.media_stream_t option -> unit
  method as_media_controls : Raw.Media_controls.t
end

class media_controls : Raw.Media_controls.t -> media_controls_t

val new_ : Media_stream.media_stream_t option -> media_controls_t
