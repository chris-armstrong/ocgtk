(* High-level class for InitableIface *)
class initable_iface (obj : Initable_iface.t) = object (self)

    method as_initable_iface = obj
end

