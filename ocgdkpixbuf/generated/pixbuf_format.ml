class type pixbuf_format_t = object
  method get_description : unit -> string option
  method get_extensions : unit -> string array option
  method get_license : unit -> string option
  method get_mime_types : unit -> string array option
  method get_name : unit -> string option
  method is_disabled : unit -> bool
  method is_save_option_supported : string -> bool
  method is_scalable : unit -> bool
  method is_writable : unit -> bool
  method set_disabled : bool -> unit
  method as_pixbuf_format : Raw.Pixbuf_format.t
end

(* High-level class for PixbufFormat *)
class pixbuf_format (obj : Raw.Pixbuf_format.t) : pixbuf_format_t =
  object (self)
    method get_description : unit -> string option =
      fun () -> Raw.Pixbuf_format.get_description obj

    method get_extensions : unit -> string array option =
      fun () -> Raw.Pixbuf_format.get_extensions obj

    method get_license : unit -> string option =
      fun () -> Raw.Pixbuf_format.get_license obj

    method get_mime_types : unit -> string array option =
      fun () -> Raw.Pixbuf_format.get_mime_types obj

    method get_name : unit -> string option =
      fun () -> Raw.Pixbuf_format.get_name obj

    method is_disabled : unit -> bool =
      fun () -> Raw.Pixbuf_format.is_disabled obj

    method is_save_option_supported : string -> bool =
      fun option_key ->
        Raw.Pixbuf_format.is_save_option_supported obj option_key

    method is_scalable : unit -> bool =
      fun () -> Raw.Pixbuf_format.is_scalable obj

    method is_writable : unit -> bool =
      fun () -> Raw.Pixbuf_format.is_writable obj

    method set_disabled : bool -> unit =
      fun disabled -> Raw.Pixbuf_format.set_disabled obj disabled

    method as_pixbuf_format = obj
  end
