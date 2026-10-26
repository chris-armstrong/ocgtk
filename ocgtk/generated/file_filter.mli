class type file_filter_t = object
  inherit GFilter.filter_t
  inherit GBuildable.buildable_t
  method add_mime_type : string -> unit
  method add_pattern : string -> unit
  method add_pixbuf_formats : unit -> unit
  method add_suffix : string -> unit
  method get_attributes : unit -> string array
  method get_name : unit -> string option
  method set_name : string option -> unit
  method to_gvariant : unit -> Gvariant.t
  method as_file_filter : File_filter.t
end

class file_filter : File_filter.t -> file_filter_t

val new_ : unit -> file_filter_t
val new_from_gvariant : Gvariant.t -> file_filter_t
