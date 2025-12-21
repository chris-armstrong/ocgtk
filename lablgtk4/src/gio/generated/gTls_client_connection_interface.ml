(* High-level class for TlsClientConnectionInterface *)
class tls_client_connection_interface (obj : Tls_client_connection_interface.t) = object (self)

    method as_tls_client_connection_interface = obj
end

