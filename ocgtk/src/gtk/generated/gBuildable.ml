(* High-level class for Buildable *)
class buildable (obj : Buildable.t) = object (self)

  method get_buildable_id : unit -> string option =
    fun () ->
      (Buildable.get_buildable_id obj)

    method as_buildable = obj
end

