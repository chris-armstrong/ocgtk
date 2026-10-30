class type buildable_t = object
  (** {2:methods Methods} *)

  method get_buildable_id : unit -> string option
  (** Gets the ID of the [buildable] object.

      [GtkBuilder] sets the name based on the ID attribute of the [<object>] tag
      used to construct the [buildable]. *)

  (** {2:conversions Conversions} *)

  method as_buildable : Raw.Buildable.t
end

(* High-level class for Buildable *)
class buildable (obj : Raw.Buildable.t) : buildable_t =
  object (self)
    method get_buildable_id : unit -> string option =
      fun () -> Raw.Buildable.get_buildable_id obj

    method as_buildable = obj
  end
