class type file_filter_t = object
  inherit Filter.filter_t
  inherit Buildable.buildable_t
  method add_mime_type : string -> unit
  method add_pattern : string -> unit
  method add_pixbuf_formats : unit -> unit
  method add_suffix : string -> unit
  method get_attributes : unit -> string array
  method get_name : unit -> string option
  method set_name : string option -> unit
  method to_gvariant : unit -> Gvariant.t
  method as_file_filter : Raw.File_filter.t
end

(* High-level class for FileFilter *)
class file_filter (obj : Raw.File_filter.t) : file_filter_t =
  object (self)
    inherit Filter.filter (obj :> Raw.Filter.t)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method add_mime_type : string -> unit =
      fun mime_type -> Raw.File_filter.add_mime_type obj mime_type

    method add_pattern : string -> unit =
      fun pattern -> Raw.File_filter.add_pattern obj pattern

    method add_pixbuf_formats : unit -> unit =
      fun () -> Raw.File_filter.add_pixbuf_formats obj

    method add_suffix : string -> unit =
      fun suffix -> Raw.File_filter.add_suffix obj suffix

    method get_attributes : unit -> string array =
      fun () -> Raw.File_filter.get_attributes obj

    method get_name : unit -> string option =
      fun () -> Raw.File_filter.get_name obj

    method set_name : string option -> unit =
      fun name -> Raw.File_filter.set_name obj name

    method to_gvariant : unit -> Gvariant.t =
      fun () -> Raw.File_filter.to_gvariant obj

    method as_file_filter = obj
  end

let new_ () : file_filter_t = new file_filter (Raw.File_filter.new_ ())

let new_from_gvariant (variant : Gvariant.t) : file_filter_t =
  let obj_ = Raw.File_filter.new_from_gvariant variant in
  new file_filter obj_
