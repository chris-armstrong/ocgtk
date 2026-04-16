class type pixbuf_format_t = object
  method copy : unit -> Pixbuf_format.t
  method free : unit -> unit
  method get_description : unit -> string
  method get_extensions : unit -> string array
  method get_license : unit -> string
  method get_mime_types : unit -> string array
  method get_name : unit -> string
  method is_disabled : unit -> bool
  method is_save_option_supported : string -> bool
  method is_scalable : unit -> bool
  method is_writable : unit -> bool
  method set_disabled : bool -> unit
  method as_pixbuf_format : Pixbuf_format.t
end

(* High-level class for PixbufFormat *)
class pixbuf_format (obj : Pixbuf_format.t) : pixbuf_format_t =
  object (self)
    method copy : unit -> Pixbuf_format.t = fun () -> Pixbuf_format.copy obj
    method free : unit -> unit = fun () -> Pixbuf_format.free obj

    method get_description : unit -> string =
      fun () -> Pixbuf_format.get_description obj

    method get_extensions : unit -> string array =
      fun () -> Pixbuf_format.get_extensions obj

    method get_license : unit -> string =
      fun () -> Pixbuf_format.get_license obj

    method get_mime_types : unit -> string array =
      fun () -> Pixbuf_format.get_mime_types obj

    method get_name : unit -> string = fun () -> Pixbuf_format.get_name obj
    method is_disabled : unit -> bool = fun () -> Pixbuf_format.is_disabled obj

    method is_save_option_supported : string -> bool =
      fun option_key -> Pixbuf_format.is_save_option_supported obj option_key

    method is_scalable : unit -> bool = fun () -> Pixbuf_format.is_scalable obj
    method is_writable : unit -> bool = fun () -> Pixbuf_format.is_writable obj

    method set_disabled : bool -> unit =
      fun disabled -> Pixbuf_format.set_disabled obj disabled

    method as_pixbuf_format = obj
  end
