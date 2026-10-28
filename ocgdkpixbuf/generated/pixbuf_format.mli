(** A [GdkPixbufFormat] contains information about the image format accepted by
    a module.

    Its methods, signals and properties are on {!class-type-pixbuf_format_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgdkpixbuf.Raw.Pixbuf_format}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PixbufFormat].}

    A [GdkPixbufFormat] contains information about the image format accepted by
    a module.

    Only modules should access the fields directly, applications should use the
    [gdk_pixbuf_format_*] family of functions. *)
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

      See gdk_pixbuf_format_set_disabled(). *)

  method is_save_option_supported : string -> bool
  (** Returns [TRUE] if the save option specified by [option_key] is supported
      when saving a pixbuf using the module implementing [format].

      See gdk_pixbuf_save() for more information about option keys. *)

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
      inappropriate license, see gdk_pixbuf_format_get_license(). *)

  (** {2:conversions Conversions} *)

  method as_pixbuf_format : Raw.Pixbuf_format.t
end

class pixbuf_format : Raw.Pixbuf_format.t -> pixbuf_format_t
(** Wraps a raw handle of {!Ocgdkpixbuf.Raw.Pixbuf_format.t}. *)

(** {1:description Description}

    A [GdkPixbufFormat] contains information about the image format accepted by
    a module.

    Only modules should access the fields directly, applications should use the
    [gdk_pixbuf_format_*] family of functions. *)
