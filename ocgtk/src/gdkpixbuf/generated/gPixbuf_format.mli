class type pixbuf_format_t = object
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

class pixbuf_format : Pixbuf_format.t -> pixbuf_format_t
