class media_controls : Media_controls.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_media_stream : unit -> GMedia_stream.media_stream option
    method set_media_stream : #GMedia_stream.media_stream option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_media_controls : Media_controls.t
  end

