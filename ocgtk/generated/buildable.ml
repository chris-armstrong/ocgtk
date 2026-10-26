class type buildable_t = object
  method get_buildable_id : unit -> string option
  method as_buildable : Raw.Buildable.t
end

(* High-level class for Buildable *)
class buildable (obj : Raw.Buildable.t) : buildable_t =
  object (self)
    method get_buildable_id : unit -> string option =
      fun () -> Raw.Buildable.get_buildable_id obj

    method as_buildable = obj
  end
