(* High-level class for TlsServerConnectionInterface *)
class tls_server_connection_interface (obj : Tls_server_connection_interface.t) = object (self)

    method as_tls_server_connection_interface = obj
end

