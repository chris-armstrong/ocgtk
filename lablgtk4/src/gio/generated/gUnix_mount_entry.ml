(* High-level class for UnixMountEntry *)
class unix_mount_entry (obj : Unix_mount_entry.t) = object (self)

    method as_unix_mount_entry = obj
end

