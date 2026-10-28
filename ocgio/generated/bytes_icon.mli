(** [GBytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon.

    Its methods, signals and properties are on {!class-type-bytes_icon_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.Bytes_icon}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BytesIcon].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.Icon.class-type-icon_t}Ocgio.Icon}
    - {{!Ocgio.Loadable_icon.class-type-loadable_icon_t}Ocgio.Loadable_icon}

    [GBytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon. *)
class type bytes_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t

  (** {2:methods Methods} *)

  method get_bytes : unit -> Glib_bytes.t
  (** Gets the [GBytes] associated with the given [icon]. *)

  (** {2:conversions Conversions} *)

  method as_bytes_icon : Raw.Bytes_icon.t
end

class bytes_icon : Raw.Bytes_icon.t -> bytes_icon_t
(** Wraps a raw handle of {!Ocgio.Raw.Bytes_icon.t}. *)

(** {1:constructors Constructors} *)

val new_ : Glib_bytes.t -> bytes_icon_t
(** Creates a new icon for a bytes.

    This cannot fail, but loading and interpreting the bytes may fail later on
    (for example, if g_loadable_icon_load() is called) if the image is invalid.
*)
