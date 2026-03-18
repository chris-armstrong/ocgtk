(* High-level class for MediaFile *)
class media_file (obj : Media_file.t) = object (self)

  method clear : unit -> unit =
    fun () ->
      (Media_file.clear obj)

  method get_file : unit -> Ocgtk_gio.Gio.file option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (Media_file.get_file obj)

  method get_input_stream : unit -> Ocgtk_gio.Gio.input_stream option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.input_stream ret) (Media_file.get_input_stream obj)

  method set_file : 'p1. (#Ocgtk_gio.Gio.file as 'p1) option -> unit =
    fun file ->
      let file = Option.map (fun (c) -> c#as_file) file in
      (Media_file.set_file obj file)

  method set_filename : string option -> unit =
    fun filename ->
      (Media_file.set_filename obj filename)

  method set_input_stream : 'p1. (#Ocgtk_gio.Gio.input_stream as 'p1) option -> unit =
    fun stream ->
      let stream = Option.map (fun (c) -> c#as_input_stream) stream in
      (Media_file.set_input_stream obj stream)

  method set_resource : string option -> unit =
    fun resource_path ->
      (Media_file.set_resource obj resource_path)

    method as_media_file = obj
end

