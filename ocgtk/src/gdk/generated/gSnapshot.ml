class type snapshot_t = object
    method as_snapshot : Snapshot.t
end

(* High-level class for Snapshot *)
class snapshot (obj : Snapshot.t) : snapshot_t = object (self)

    method as_snapshot = obj
end

