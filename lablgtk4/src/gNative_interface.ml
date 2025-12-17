(* High-level class for NativeInterface *)
class native_interface (obj : Native_interface.t) = object (self)

    method as_native_interface = obj
end

