(* High-level class for BuildableIface *)
class buildable_iface (obj : Buildable_iface.t) = object (self)

    method as_buildable_iface = obj
end

