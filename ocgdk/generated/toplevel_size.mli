(** Contains information that is useful to compute the size of a toplevel.

    Its methods, signals and properties are on {!class-type-toplevel_size_t}.
    The functions it is built on are in {!Ocgdk.Raw.Toplevel_size}. *)

(** The methods, signals and properties of a [GdkToplevelSize]. *)
class type toplevel_size_t = object
  method set_min_size : int -> int -> unit
  method set_shadow_width : int -> int -> int -> int -> unit
  method set_size : int -> int -> unit
  method as_toplevel_size : Raw.Toplevel_size.t
end

class toplevel_size : Raw.Toplevel_size.t -> toplevel_size_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Toplevel_size.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkToplevelSize], give one already wrapped. *)
