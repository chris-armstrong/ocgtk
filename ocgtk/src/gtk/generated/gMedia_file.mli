class type media_file_t = object
    inherit GMedia_stream.media_stream_t
    method clear : unit -> unit
    method get_file : unit -> Ocgtk_gio.Gio.file_t option
    method get_input_stream : unit -> Ocgtk_gio.Gio.input_stream_t option
    method set_file : Ocgtk_gio.Gio.file_t option -> unit
    method set_filename : string option -> unit
    method set_input_stream : Ocgtk_gio.Gio.input_stream_t option -> unit
    method set_resource : string option -> unit
    method as_media_file : Media_file.t
end

class media_file : Media_file.t -> media_file_t

