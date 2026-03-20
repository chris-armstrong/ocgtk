class type unix_mount_entry_t = object
    method as_unix_mount_entry : Unix_mount_entry.t
end

(* High-level class for UnixMountEntry *)
class unix_mount_entry (obj : Unix_mount_entry.t) : unix_mount_entry_t = object (self)

    method as_unix_mount_entry = obj
end

