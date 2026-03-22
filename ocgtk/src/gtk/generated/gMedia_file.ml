class type media_file_t = object
    inherit GMedia_stream.media_stream_t
    method clear : unit -> unit
    method get_file : unit -> Ocgtk_gio.Gio.File.file_t option
    method get_input_stream : unit -> Ocgtk_gio.Gio.Input_stream.input_stream_t option
    method set_file : Ocgtk_gio.Gio.File.file_t option -> unit
    method set_filename : string option -> unit
    method set_input_stream : Ocgtk_gio.Gio.Input_stream.input_stream_t option -> unit
    method set_resource : string option -> unit
    method as_media_file : Media_file.t
end

(* High-level class for MediaFile *)
class media_file (obj : Media_file.t) : media_file_t = object (self)
  inherit GMedia_stream.media_stream (Obj.magic obj : Media_stream.t)

  method clear : unit -> unit =
    fun () ->
      (Media_file.clear obj)

  method get_file : unit -> Ocgtk_gio.Gio.File.file_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.File.file ret) (Media_file.get_file obj)

  method get_input_stream : unit -> Ocgtk_gio.Gio.Input_stream.input_stream_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.Input_stream.input_stream ret) (Media_file.get_input_stream obj)

  method set_file : Ocgtk_gio.Gio.File.file_t option -> unit =
    fun file ->
      let file = Option.map (fun (c) -> c#as_file) file in
      (Media_file.set_file obj file)

  method set_filename : string option -> unit =
    fun filename ->
      (Media_file.set_filename obj filename)

  method set_input_stream : Ocgtk_gio.Gio.Input_stream.input_stream_t option -> unit =
    fun stream ->
      let stream = Option.map (fun (c) -> c#as_input_stream) stream in
      (Media_file.set_input_stream obj stream)

  method set_resource : string option -> unit =
    fun resource_path ->
      (Media_file.set_resource obj resource_path)

    method as_media_file = obj
end

let new_ () : media_file_t =
  new media_file (Media_file.new_ ())

let new_for_file (file : Ocgtk_gio.Gio.File.file_t) : media_file_t =
  let file = file#as_file in
  new media_file (Media_file.new_for_file file)

let new_for_filename (filename : string) : media_file_t =
  new media_file (Media_file.new_for_filename filename)

let new_for_input_stream (stream : Ocgtk_gio.Gio.Input_stream.input_stream_t) : media_file_t =
  let stream = stream#as_input_stream in
  new media_file (Media_file.new_for_input_stream stream)

let new_for_resource (resource_path : string) : media_file_t =
  new media_file (Media_file.new_for_resource resource_path)

