(** A [GdkPixbufFormat] contains information about the image format accepted by
    a module.

    Only modules should access the fields directly, applications should use the
    [gdk_pixbuf_format_*] family of functions.

    Its methods, signals and properties are on {!class-type-pixbuf_format_t}.
    The functions it is built on are in {!Ocgdkpixbuf.Raw.Pixbuf_format}. *)

(** The methods, signals and properties of a [GdkPixbufFormat]. *)
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

class pixbuf_format : Raw.Pixbuf_format.t -> pixbuf_format_t
(** Wraps a layer 1 handle, {!Ocgdkpixbuf.Raw.Pixbuf_format.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkPixbufFormat], give one already wrapped. *)
