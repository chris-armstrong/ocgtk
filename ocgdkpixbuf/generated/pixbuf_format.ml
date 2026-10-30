class type pixbuf_format_t = object
  (** {2:methods Methods} *)

  method get_description : unit -> string option
  (** Returns a description of the format. *)

  method get_extensions : unit -> string array option
  (** Returns the filename extensions typically used for files in the given
      format. *)

  method get_license : unit -> string option
  [@@ocaml.doc
    "Returns information about the license of the image loader for the format.\n\n\
     The returned string should be a shorthand for a well known license, e.g.\n\
     \"LGPL\", \"GPL\", \"QPL\", \"GPL/QPL\", or \"other\" to indicate some \
     other license."]

  method get_mime_types : unit -> string array option
  (** Returns the mime types supported by the format. *)

  method get_name : unit -> string option
  (** Returns the name of the format. *)

  method is_disabled : unit -> bool
  (** Returns whether this image format is disabled.

      See [gdk_pixbuf_format_set_disabled ()]. *)

  method is_save_option_supported : string -> bool
  (** Returns [true] if the save option specified by [option_key] is supported
      when saving a pixbuf using the module implementing [format].

      See [gdk_pixbuf_save ()] for more information about option keys. *)

  method is_scalable : unit -> bool
  (** Returns whether this image format is scalable.

      If a file is in a scalable format, it is preferable to load it at the
      desired size, rather than loading it at the default size and scaling the
      resulting pixbuf to the desired size. *)

  method is_writable : unit -> bool
  (** Returns whether pixbufs can be saved in the given format. *)

  method set_disabled : bool -> unit
  (** Disables or enables an image format.

      If a format is disabled, GdkPixbuf won't use the image loader for this
      format to load images.

      Applications can use this to avoid using image loaders with an
      inappropriate license, see [gdk_pixbuf_format_get_license ()]. *)

  (** {2:conversions Conversions} *)

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
