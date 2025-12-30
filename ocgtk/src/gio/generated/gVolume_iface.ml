(* High-level class for VolumeIface *)
class volume_iface (obj : Volume_iface.t) = object (self)

    method as_volume_iface = obj
end

