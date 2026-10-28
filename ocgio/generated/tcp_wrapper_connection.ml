class type tcp_wrapper_connection_t = object
  inherit Tcp_connection.tcp_connection_t

  (** {2:methods Methods} *)

  method get_base_io_stream : unit -> Io_stream.io_stream_t
  (** Gets [conn]'s base [GIOStream] *)

  (** {2:conversions Conversions} *)

  method as_tcp_wrapper_connection : Raw.Tcp_wrapper_connection.t
end

(* High-level class for TcpWrapperConnection *)
class tcp_wrapper_connection (obj : Raw.Tcp_wrapper_connection.t) :
  tcp_wrapper_connection_t =
  object (self)
    inherit Tcp_connection.tcp_connection (obj :> Raw.Tcp_connection.t)

    method get_base_io_stream : unit -> Io_stream.io_stream_t =
      fun () ->
        new Io_stream.io_stream
          (Raw.Tcp_wrapper_connection.get_base_io_stream obj)

    method as_tcp_wrapper_connection = obj
  end

let new_ (base_io_stream : Io_stream.io_stream_t)
    (socket : Socket_and__socket_connection.socket_t) : tcp_wrapper_connection_t
    =
  let base_io_stream = base_io_stream#as_io_stream in
  let socket = socket#as_socket in
  let obj_ = Raw.Tcp_wrapper_connection.new_ base_io_stream socket in
  new tcp_wrapper_connection obj_
