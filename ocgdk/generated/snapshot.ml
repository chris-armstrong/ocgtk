class type snapshot_t = object
  (** {2:conversions Conversions} *)

  method as_snapshot : Raw.Snapshot.t
end

(* High-level class for Snapshot *)
class snapshot (obj : Raw.Snapshot.t) : snapshot_t =
  object (self)
    method as_snapshot = obj
  end
