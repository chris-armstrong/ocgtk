(* High-level class for TlsBackendInterface *)
class tls_backend_interface (obj : Tls_backend_interface.t) = object (self)

    method as_tls_backend_interface = obj
end

