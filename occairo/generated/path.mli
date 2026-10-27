(** Bindings for [cairo_path_t].

    Its methods, signals and properties are on {!class-type-path_t}. The
    functions it is built on are in {!Occairo.Raw.Path}. *)

(** The methods, signals and properties of a [cairo_path_t]. *)
class type path_t = object
  method as_path : Raw.Path.t
end

class path : Raw.Path.t -> path_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Path.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_path_t], give one already wrapped. *)
