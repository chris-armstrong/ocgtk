(** Bindings for [Region].

    Its methods, signals and properties are on {!class-type-region_t}. The
    functions it is built on are in {!Occairo.Raw.Region}. *)

(** The methods, signals and properties of a [Region]. *)
class type region_t = object
  method as_region : Raw.Region.t
end

class region : Raw.Region.t -> region_t
(** Wraps a raw handle of {!Occairo.Raw.Region.t}. *)
