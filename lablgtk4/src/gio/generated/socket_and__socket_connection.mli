(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Socket : sig
  type t = [`socket | `object_] Gobject.obj

  (* Methods *)
  (** Checks if a socket is capable of speaking IPv4.

  IPv4 sockets are capable of speaking IPv4.  On some operating systems
  and under some combinations of circumstances IPv6 sockets are also
  capable of speaking IPv4.  See RFC 3493 section 3.7 for more
  information.

  No other types of sockets are currently considered as being capable
  of speaking IPv4. *)
  external speaks_ipv4 : t -> bool = "ml_g_socket_speaks_ipv4"

  (** Shut down part or all of a full-duplex connection.

  If @shutdown_read is %TRUE then the receiving side of the connection
  is shut down, and further reading is disallowed.

  If @shutdown_write is %TRUE then the sending side of the connection
  is shut down, and further writing is disallowed.

  It is allowed for both @shutdown_read and @shutdown_write to be %TRUE.

  One example where it is useful to shut down only one side of a connection is
  graceful disconnect for TCP connections where you close the sending side,
  then wait for the other side to close the connection, thus ensuring that the
  other side saw all sent data. *)
  external shutdown : t -> bool -> bool -> (bool, GError.t) result = "ml_g_socket_shutdown"

  (** Sets the time-to-live for outgoing unicast packets on @socket.
  By default the platform-specific default value is used. *)
  external set_ttl : t -> int -> unit = "ml_g_socket_set_ttl"

  (** Sets the time in seconds after which I/O operations on @socket will
  time out if they have not yet completed.

  On a blocking socket, this means that any blocking #GSocket
  operation will time out after @timeout seconds of inactivity,
  returning %G_IO_ERROR_TIMED_OUT.

  On a non-blocking socket, calls to g_socket_condition_wait() will
  also fail with %G_IO_ERROR_TIMED_OUT after the given time. Sources
  created with g_socket_create_source() will trigger after
  @timeout seconds of inactivity, with the requested condition
  set, at which point calling g_socket_receive(), g_socket_send(),
  g_socket_check_connect_result(), etc, will fail with
  %G_IO_ERROR_TIMED_OUT.

  If @timeout is 0 (the default), operations will never time out
  on their own.

  Note that if an I/O operation is interrupted by a signal, this may
  cause the timeout to be reset. *)
  external set_timeout : t -> int -> unit = "ml_g_socket_set_timeout"

  (** Sets the value of an integer-valued option on @socket, as with
  setsockopt(). (If you need to set a non-integer-valued option,
  you will need to call setsockopt() directly.)

  The [<gio/gnetworking.h>][gio-gnetworking.h]
  header pulls in system headers that will define most of the
  standard/portable socket options. For unusual socket protocols or
  platform-dependent options, you may need to include additional
  headers. *)
  external set_option : t -> int -> int -> int -> (bool, GError.t) result = "ml_g_socket_set_option"

  (** Sets the time-to-live for outgoing multicast datagrams on @socket.
  By default, this is 1, meaning that multicast packets will not leave
  the local network. *)
  external set_multicast_ttl : t -> int -> unit = "ml_g_socket_set_multicast_ttl"

  (** Sets whether outgoing multicast packets will be received by sockets
  listening on that multicast address on the same host. This is %TRUE
  by default. *)
  external set_multicast_loopback : t -> bool -> unit = "ml_g_socket_set_multicast_loopback"

  (** Sets the maximum number of outstanding connections allowed
  when listening on this socket. If more clients than this are
  connecting to the socket and the application is not handling them
  on time then the new connections will be refused.

  Note that this must be called before g_socket_listen() and has no
  effect if called after that. *)
  external set_listen_backlog : t -> int -> unit = "ml_g_socket_set_listen_backlog"

  (** Sets or unsets the %SO_KEEPALIVE flag on the underlying socket. When
  this flag is set on a socket, the system will attempt to verify that the
  remote socket endpoint is still present if a sufficiently long period of
  time passes with no data being exchanged. If the system is unable to
  verify the presence of the remote endpoint, it will automatically close
  the connection.

  This option is only functional on certain kinds of sockets. (Notably,
  %G_SOCKET_PROTOCOL_TCP sockets.)

  The exact time between pings is system- and protocol-dependent, but will
  normally be at least two hours. Most commonly, you would set this flag
  on a server socket if you want to allow clients to remain idle for long
  periods of time, but also want to ensure that connections are eventually
  garbage-collected if clients crash or become unreachable. *)
  external set_keepalive : t -> bool -> unit = "ml_g_socket_set_keepalive"

  (** Sets whether @socket should allow sending to broadcast addresses.
  This is %FALSE by default. *)
  external set_broadcast : t -> bool -> unit = "ml_g_socket_set_broadcast"

  (** Sets the blocking mode of the socket. In blocking mode
  all operations (which don’t take an explicit blocking parameter) block until
  they succeed or there is an error. In
  non-blocking mode all functions return results immediately or
  with a %G_IO_ERROR_WOULD_BLOCK error.

  All sockets are created in blocking mode. However, note that the
  platform level socket is always non-blocking, and blocking mode
  is a GSocket level feature. *)
  external set_blocking : t -> bool -> unit = "ml_g_socket_set_blocking"

  (** Marks the socket as a server socket, i.e. a socket that is used
  to accept incoming requests using g_socket_accept().

  Before calling this the socket must be bound to a local address using
  g_socket_bind().

  To set the maximum amount of outstanding clients, use
  g_socket_set_listen_backlog(). *)
  external listen : t -> (bool, GError.t) result = "ml_g_socket_listen"

  (** Removes @socket from the multicast group defined by @group, @iface,
  and @source_specific (which must all have the same values they had
  when you joined the group).

  @socket remains bound to its address and port, and can still receive
  unicast messages after calling this. *)
  external leave_multicast_group_ssm : t -> Inet_address.t -> Inet_address.t option -> string option -> (bool, GError.t) result = "ml_g_socket_leave_multicast_group_ssm"

  (** Removes @socket from the multicast group defined by @group, @iface,
  and @source_specific (which must all have the same values they had
  when you joined the group).

  @socket remains bound to its address and port, and can still receive
  unicast messages after calling this.

  To unbind to a given source-specific multicast address, use
  g_socket_leave_multicast_group_ssm() instead. *)
  external leave_multicast_group : t -> Inet_address.t -> bool -> string option -> (bool, GError.t) result = "ml_g_socket_leave_multicast_group"

  (** Registers @socket to receive multicast messages sent to @group.
  @socket must be a %G_SOCKET_TYPE_DATAGRAM socket, and must have
  been bound to an appropriate interface and port with
  g_socket_bind().

  If @iface is %NULL, the system will automatically pick an interface
  to bind to based on @group.

  If @source_specific is not %NULL, use source-specific multicast as
  defined in RFC 4604. Note that on older platforms this may fail
  with a %G_IO_ERROR_NOT_SUPPORTED error.

  Note that this function can be called multiple times for the same
  @group with different @source_specific in order to receive multicast
  packets from more than one source. *)
  external join_multicast_group_ssm : t -> Inet_address.t -> Inet_address.t option -> string option -> (bool, GError.t) result = "ml_g_socket_join_multicast_group_ssm"

  (** Registers @socket to receive multicast messages sent to @group.
  @socket must be a %G_SOCKET_TYPE_DATAGRAM socket, and must have
  been bound to an appropriate interface and port with
  g_socket_bind().

  If @iface is %NULL, the system will automatically pick an interface
  to bind to based on @group.

  If @source_specific is %TRUE, source-specific multicast as defined
  in RFC 4604 is used. Note that on older platforms this may fail
  with a %G_IO_ERROR_NOT_SUPPORTED error.

  To bind to a given source-specific multicast address, use
  g_socket_join_multicast_group_ssm() instead. *)
  external join_multicast_group : t -> Inet_address.t -> bool -> string option -> (bool, GError.t) result = "ml_g_socket_join_multicast_group"

  (** Check whether the socket is connected. This is only useful for
  connection-oriented sockets.

  If using g_socket_shutdown(), this function will return %TRUE until the
  socket has been shut down for reading and writing. If you do a non-blocking
  connect, this function will not return %TRUE until after you call
  g_socket_check_connect_result(). *)
  external is_connected : t -> bool = "ml_g_socket_is_connected"

  (** Checks whether a socket is closed. *)
  external is_closed : t -> bool = "ml_g_socket_is_closed"

  (** Gets the unicast time-to-live setting on @socket; see
  g_socket_set_ttl() for more details. *)
  external get_ttl : t -> int = "ml_g_socket_get_ttl"

  (** Gets the timeout setting of the socket. For details on this, see
  g_socket_set_timeout(). *)
  external get_timeout : t -> int = "ml_g_socket_get_timeout"

  (** Gets the socket type of the socket. *)
  external get_socket_type : t -> Gio_enums.sockettype = "ml_g_socket_get_socket_type"

  (** Try to get the remote address of a connected socket. This is only
  useful for connection oriented sockets that have been connected. *)
  external get_remote_address : t -> (Socket_address.t, GError.t) result = "ml_g_socket_get_remote_address"

  (** Gets the socket protocol id the socket was created with.
  In case the protocol is unknown, -1 is returned. *)
  external get_protocol : t -> Gio_enums.socketprotocol = "ml_g_socket_get_protocol"

  (** Gets the value of an integer-valued option on @socket, as with
  getsockopt(). (If you need to fetch a  non-integer-valued option,
  you will need to call getsockopt() directly.)

  The [<gio/gnetworking.h>][gio-gnetworking.h]
  header pulls in system headers that will define most of the
  standard/portable socket options. For unusual socket protocols or
  platform-dependent options, you may need to include additional
  headers.

  Note that even for socket options that are a single byte in size,
  @value is still a pointer to a #gint variable, not a #guchar;
  g_socket_get_option() will handle the conversion internally. *)
  external get_option : t -> int -> int -> (bool * int, GError.t) result = "ml_g_socket_get_option"

  (** Gets the multicast time-to-live setting on @socket; see
  g_socket_set_multicast_ttl() for more details. *)
  external get_multicast_ttl : t -> int = "ml_g_socket_get_multicast_ttl"

  (** Gets the multicast loopback setting on @socket; if %TRUE (the
  default), outgoing multicast packets will be looped back to
  multicast listeners on the same host. *)
  external get_multicast_loopback : t -> bool = "ml_g_socket_get_multicast_loopback"

  (** Try to get the local address of a bound socket. This is only
  useful if the socket has been bound to a local address,
  either explicitly or implicitly when connecting. *)
  external get_local_address : t -> (Socket_address.t, GError.t) result = "ml_g_socket_get_local_address"

  (** Gets the listen backlog setting of the socket. For details on this,
  see g_socket_set_listen_backlog(). *)
  external get_listen_backlog : t -> int = "ml_g_socket_get_listen_backlog"

  (** Gets the keepalive mode of the socket. For details on this,
  see g_socket_set_keepalive(). *)
  external get_keepalive : t -> bool = "ml_g_socket_get_keepalive"

  (** Returns the underlying OS socket object. On unix this
  is a socket file descriptor, and on Windows this is
  a Winsock2 SOCKET handle. This may be useful for
  doing platform specific or otherwise unusual operations
  on the socket. *)
  external get_fd : t -> int = "ml_g_socket_get_fd"

  (** Gets the socket family of the socket. *)
  external get_family : t -> Gio_enums.socketfamily = "ml_g_socket_get_family"

  (** Returns the credentials of the foreign process connected to this
  socket, if any (e.g. it is only supported for %G_SOCKET_FAMILY_UNIX
  sockets).

  If this operation isn't supported on the OS, the method fails with
  the %G_IO_ERROR_NOT_SUPPORTED error. On Linux this is implemented
  by reading the %SO_PEERCRED option on the underlying socket.

  This method can be expected to be available on the following platforms:

  - Linux since GLib 2.26
  - OpenBSD since GLib 2.30
  - Solaris, Illumos and OpenSolaris since GLib 2.40
  - NetBSD since GLib 2.42
  - macOS, tvOS, iOS since GLib 2.66

  Other ways to obtain credentials from a foreign peer includes the
  #GUnixCredentialsMessage type and
  g_unix_connection_send_credentials() /
  g_unix_connection_receive_credentials() functions. *)
  external get_credentials : t -> (Credentials.t, GError.t) result = "ml_g_socket_get_credentials"

  (** Gets the broadcast setting on @socket; if %TRUE,
  it is possible to send packets to broadcast
  addresses. *)
  external get_broadcast : t -> bool = "ml_g_socket_get_broadcast"

  (** Gets the blocking mode of the socket. For details on blocking I/O,
  see g_socket_set_blocking(). *)
  external get_blocking : t -> bool = "ml_g_socket_get_blocking"

  (** Creates a #GSocketConnection subclass of the right type for
  @socket. *)
  external connection_factory_create_connection : t -> Socket_connection.t = "ml_g_socket_connection_factory_create_connection"

  (** Connect the socket to the specified remote address.

  For connection oriented socket this generally means we attempt to make
  a connection to the @address. For a connection-less socket it sets
  the default address for g_socket_send() and discards all incoming datagrams
  from other sources.

  Generally connection oriented sockets can only connect once, but
  connection-less sockets can connect multiple times to change the
  default address.

  If the connect call needs to do network I/O it will block, unless
  non-blocking I/O is enabled. Then %G_IO_ERROR_PENDING is returned
  and the user can be notified of the connection finishing by waiting
  for the G_IO_OUT condition. The result of the connection must then be
  checked with g_socket_check_connect_result(). *)
  external connect : t -> Socket_address.t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_socket_connect"

  (** Closes the socket, shutting down any active connection.

  Closing a socket does not wait for all outstanding I/O operations
  to finish, so the caller should not rely on them to be guaranteed
  to complete even if the close returns with no error.

  Once the socket is closed, all other operations will return
  %G_IO_ERROR_CLOSED. Closing a socket multiple times will not
  return an error.

  Sockets will be automatically closed when the last reference
  is dropped, but you might want to call this function to make sure
  resources are released as early as possible.

  Beware that due to the way that TCP works, it is possible for
  recently-sent data to be lost if either you close a socket while the
  %G_IO_IN condition is set, or else if the remote connection tries to
  send something to you after you close the socket but before it has
  finished reading all of the data you sent. There is no easy generic
  way to avoid this problem; the easiest fix is to design the network
  protocol such that the client will never send data "out of turn".
  Another solution is for the server to half-close the connection by
  calling g_socket_shutdown() with only the @shutdown_write flag set,
  and then wait for the client to notice this and close its side of the
  connection, after which the server can safely call g_socket_close().
  (This is what #GTcpConnection does if you call
  g_tcp_connection_set_graceful_disconnect(). But of course, this
  only works if the client will close its connection after the server
  does.) *)
  external close : t -> (bool, GError.t) result = "ml_g_socket_close"

  (** Checks and resets the pending connect error for the socket.
  This is used to check for errors when g_socket_connect() is
  used in non-blocking mode. *)
  external check_connect_result : t -> (bool, GError.t) result = "ml_g_socket_check_connect_result"

  (** When a socket is created it is attached to an address family, but it
  doesn't have an address in this family. g_socket_bind() assigns the
  address (sometimes called name) of the socket.

  It is generally required to bind to a local address before you can
  receive connections. (See g_socket_listen() and g_socket_accept() ).
  In certain situations, you may also want to bind a socket that will be
  used to initiate connections, though this is not normally required.

  If @socket is a TCP socket, then @allow_reuse controls the setting
  of the `SO_REUSEADDR` socket option; normally it should be %TRUE for
  server sockets (sockets that you will eventually call
  g_socket_accept() on), and %FALSE for client sockets. (Failing to
  set this flag on a server socket may cause g_socket_bind() to return
  %G_IO_ERROR_ADDRESS_IN_USE if the server program is stopped and then
  immediately restarted.)

  If @socket is a UDP socket, then @allow_reuse determines whether or
  not other UDP sockets can be bound to the same address at the same
  time. In particular, you can have several UDP sockets bound to the
  same address, and they will all receive all of the multicast and
  broadcast packets sent to that address. (The behavior of unicast
  UDP packets to an address with multiple listeners is not defined.) *)
  external bind : t -> Socket_address.t -> bool -> (bool, GError.t) result = "ml_g_socket_bind"

  (** Accept incoming connections on a connection-based socket. This removes
  the first outstanding connection request from the listening socket and
  creates a #GSocket object for it.

  The @socket must be bound to a local address with g_socket_bind() and
  must be listening for incoming connections (g_socket_listen()).

  If there are no outstanding connections then the operation will block
  or return %G_IO_ERROR_WOULD_BLOCK if non-blocking I/O is enabled.
  To be notified of an incoming connection, wait for the %G_IO_IN condition. *)
  external accept : t -> Cancellable.t option -> (t, GError.t) result = "ml_g_socket_accept"

  (* Properties *)

  (** Get property: type *)
  external get_type : t -> Gio_enums.sockettype = "ml_gtk_socket_get_type"


end

and Socket_connection
 : sig
  type t = [`socket_connection | `io_stream | `object_] Gobject.obj

  (* Methods *)
  (** Checks if @connection is connected. This is equivalent to calling
  g_socket_is_connected() on @connection's underlying #GSocket. *)
  external is_connected : t -> bool = "ml_g_socket_connection_is_connected"

  (** Gets the underlying #GSocket object of the connection.
  This can be useful if you want to do something unusual on it
  not supported by the #GSocketConnection APIs. *)
  external get_socket : t -> Socket.t = "ml_g_socket_connection_get_socket"

  (** Try to get the remote address of a socket connection.

  Since GLib 2.40, when used with g_socket_client_connect() or
  g_socket_client_connect_async(), during emission of
  %G_SOCKET_CLIENT_CONNECTING, this function will return the remote
  address that will be used for the connection.  This allows
  applications to print e.g. "Connecting to example.com
  (10.42.77.3)...". *)
  external get_remote_address : t -> (Socket_address.t, GError.t) result = "ml_g_socket_connection_get_remote_address"

  (** Try to get the local address of a socket connection. *)
  external get_local_address : t -> (Socket_address.t, GError.t) result = "ml_g_socket_connection_get_local_address"

  (** Gets the result of a g_socket_connection_connect_async() call. *)
  external connect_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_socket_connection_connect_finish"

  (** Connect @connection to the specified remote address. *)
  external connect : t -> Socket_address.t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_socket_connection_connect"

  (* Properties *)


end
