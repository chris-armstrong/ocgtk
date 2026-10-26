class type snapshot_t = object
  method as_snapshot : Raw.Snapshot.t
end

class snapshot : Raw.Snapshot.t -> snapshot_t
