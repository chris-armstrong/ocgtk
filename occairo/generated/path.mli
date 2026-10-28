(** Bindings for [Path].

    Its methods, signals and properties are on {!class-type-path_t}. The
    functions it is built on are in {!Occairo.Raw.Path}. *)

(** The methods, signals and properties of a [Path]. *)
class type path_t = object
  method as_path : Raw.Path.t
end

class path : Raw.Path.t -> path_t
(** Wraps a raw handle of {!Occairo.Raw.Path.t}. *)
