class type media_file_t = object
  inherit Media_stream.media_stream_t
  method clear : unit -> unit
  method get_file : unit -> Ocgio.File.file_t option
  method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t option
  method set_file : Ocgio.File.file_t option -> unit
  method set_filename : string option -> unit
  method set_input_stream : Ocgio.Input_stream.input_stream_t option -> unit
  method set_resource : string option -> unit
  method as_media_file : Raw.Media_file.t
end

class media_file : Raw.Media_file.t -> media_file_t

val new_ : unit -> media_file_t
val new_for_file : Ocgio.File.file_t -> media_file_t
val new_for_filename : string -> media_file_t
val new_for_input_stream : Ocgio.Input_stream.input_stream_t -> media_file_t
val new_for_resource : string -> media_file_t
