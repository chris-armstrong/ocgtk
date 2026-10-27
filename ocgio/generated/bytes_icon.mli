(** [GBytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon.

    Its methods, signals and properties are on {!class-type-bytes_icon_t}. The
    functions it is built on are in {!Ocgio.Raw.Bytes_icon}. *)

(** The methods, signals and properties of a [GBytesIcon]. *)
class type bytes_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t

  method get_bytes : unit -> Glib_bytes.t
  (** Gets the [GBytes] associated with the given [icon]. *)

  method as_bytes_icon : Raw.Bytes_icon.t
end

class bytes_icon : Raw.Bytes_icon.t -> bytes_icon_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Bytes_icon.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GBytesIcon], give one already wrapped. *)

val new_ : Glib_bytes.t -> bytes_icon_t
