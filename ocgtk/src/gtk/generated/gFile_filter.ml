class type file_filter_t = object
    inherit GFilter.filter_t
    method add_mime_type : string -> unit
    method add_pattern : string -> unit
    method add_pixbuf_formats : unit -> unit
    method add_suffix : string -> unit
    method get_attributes : unit -> string array
    method get_name : unit -> string option
    method set_name : string option -> unit
    method mime_types : string array
    method patterns : string array
    method suffixes : string array
    method as_file_filter : File_filter.t
end

(* High-level class for FileFilter *)
class file_filter (obj : File_filter.t) : file_filter_t = object (self)
  inherit GFilter.filter (obj :> Filter.t)

  method add_mime_type : string -> unit =
    fun mime_type ->
      (File_filter.add_mime_type obj mime_type)

  method add_pattern : string -> unit =
    fun pattern ->
      (File_filter.add_pattern obj pattern)

  method add_pixbuf_formats : unit -> unit =
    fun () ->
      (File_filter.add_pixbuf_formats obj)

  method add_suffix : string -> unit =
    fun suffix ->
      (File_filter.add_suffix obj suffix)

  method get_attributes : unit -> string array =
    fun () ->
      (File_filter.get_attributes obj)

  method get_name : unit -> string option =
    fun () ->
      (File_filter.get_name obj)

  method set_name : string option -> unit =
    fun name ->
      (File_filter.set_name obj name)

  method mime_types = File_filter.get_mime_types obj

  method patterns = File_filter.get_patterns obj

  method suffixes = File_filter.get_suffixes obj

    method as_file_filter = obj
end

let new_ () : file_filter_t =
  new file_filter (File_filter.new_ ())

