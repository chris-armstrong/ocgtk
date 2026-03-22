class type video_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
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

class video : Video.t -> video_t

