class type media_file_t = object
  inherit Media_stream.media_stream_t

  (** {2:methods Methods} *)

  method clear : unit -> unit
  (** Resets the media file to be empty. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Returns the file that [self] is currently playing from.

      When [self] is not playing or not playing from a file, [NULL] is returned.
  *)

  method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t option
  (** Returns the stream that [self] is currently playing from.

      When [self] is not playing or not playing from a stream, [NULL] is
      returned. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Sets the [GtkMediaFile] to play the given file.

      If any file is still playing, stop playing it. *)

  method set_filename : string option -> unit
  (** Sets the [GtkMediaFile] to play the given file.

      This is a utility function that converts the given [filename] to a [GFile]
      and calls [Gtk.MediaFile.set_file]. *)

  method set_input_stream : Ocgio.Input_stream.input_stream_t option -> unit
  (** Sets the [GtkMediaFile] to play the given stream.

      If anything is still playing, stop playing it.

      Full control about the [stream] is assumed for the duration of playback.
      The stream will not be closed. *)

  method set_resource : string option -> unit
  (** Sets the [GtkMediaFile] to play the given resource.

      This is a utility function that converts the given [resource_path] to a
      [GFile] and calls [Gtk.MediaFile.set_file]. *)

  (** {2:conversions Conversions} *)

  method as_media_file : Raw.Media_file.t
end

(* High-level class for MediaFile *)
class media_file (obj : Raw.Media_file.t) : media_file_t =
  object (self)
    inherit Media_stream.media_stream (obj :> Raw.Media_stream.t)
    method clear : unit -> unit = fun () -> Raw.Media_file.clear obj

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.Media_file.get_file obj)

    method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Input_stream.input_stream ret)
          (Raw.Media_file.get_input_stream obj)

    method set_file : Ocgio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        Raw.Media_file.set_file obj file

    method set_filename : string option -> unit =
      fun filename -> Raw.Media_file.set_filename obj filename

    method set_input_stream : Ocgio.Input_stream.input_stream_t option -> unit =
      fun stream ->
        let stream = Option.map (fun c -> c#as_input_stream) stream in
        Raw.Media_file.set_input_stream obj stream

    method set_resource : string option -> unit =
      fun resource_path -> Raw.Media_file.set_resource obj resource_path

    method as_media_file = obj
  end

let new_ () : media_file_t = new media_file (Raw.Media_file.new_ ())

let new_for_file (file : Ocgio.File.file_t) : media_file_t =
  let file = file#as_file in
  let obj_ = Raw.Media_file.new_for_file file in
  new media_file obj_

let new_for_filename (filename : string) : media_file_t =
  let obj_ = Raw.Media_file.new_for_filename filename in
  new media_file obj_

let new_for_input_stream (stream : Ocgio.Input_stream.input_stream_t) :
    media_file_t =
  let stream = stream#as_input_stream in
  let obj_ = Raw.Media_file.new_for_input_stream stream in
  new media_file obj_

let new_for_resource (resource_path : string) : media_file_t =
  let obj_ = Raw.Media_file.new_for_resource resource_path in
  new media_file obj_
