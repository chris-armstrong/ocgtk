(* High-level class for AsyncResultIface *)
class async_result_iface (obj : Async_result_iface.t) = object (self)

    method as_async_result_iface = obj
end

