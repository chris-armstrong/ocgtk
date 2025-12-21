(* High-level class for AsyncInitableIface *)
class async_initable_iface (obj : Async_initable_iface.t) = object (self)

    method as_async_initable_iface = obj
end

