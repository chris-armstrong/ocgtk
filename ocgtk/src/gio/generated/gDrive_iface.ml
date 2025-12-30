(* High-level class for DriveIface *)
class drive_iface (obj : Drive_iface.t) = object (self)

    method as_drive_iface = obj
end

