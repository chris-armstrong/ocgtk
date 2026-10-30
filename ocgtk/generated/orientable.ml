class type orientable_t = object
  (** {2:methods Methods} *)

  method get_orientation : unit -> Enums.orientation
  (** Retrieves the orientation of the [orientable]. *)

  method set_orientation : Enums.orientation -> unit
  (** Sets the orientation of the [orientable]. *)

  (** {2:conversions Conversions} *)

  method as_orientable : Raw.Orientable.t
end

(* High-level class for Orientable *)
class orientable (obj : Raw.Orientable.t) : orientable_t =
  object (self)
    method get_orientation : unit -> Enums.orientation =
      fun () -> Raw.Orientable.get_orientation obj

    method set_orientation : Enums.orientation -> unit =
      fun orientation -> Raw.Orientable.set_orientation obj orientation

    method as_orientable = obj
  end
