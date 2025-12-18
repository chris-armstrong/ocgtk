(* High-level class for FileFilter *)
class file_filter (obj : File_filter.t) = object (self)

  method name = File_filter.get_name obj
  method set_name v = File_filter.set_name obj v

  method add_mime_type : string -> unit = fun mime_type -> (File_filter.add_mime_type obj mime_type)

  method add_pattern : string -> unit = fun pattern -> (File_filter.add_pattern obj pattern)

  method add_pixbuf_formats : unit -> unit = fun () -> (File_filter.add_pixbuf_formats obj )

  method add_suffix : string -> unit = fun suffix -> (File_filter.add_suffix obj suffix)

  method get_attributes : unit -> unit = fun () -> (File_filter.get_attributes obj )

    method as_file_filter = obj
end

