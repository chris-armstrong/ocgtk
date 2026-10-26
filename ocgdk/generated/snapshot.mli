class type snapshot_t = object
  method as_snapshot : Snapshot.t
end

class snapshot : Snapshot.t -> snapshot_t
