(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Socket from cyclic group Socket_and__socket_connection *)

(** A [GSocket] is a low-level networking primitive. It is a more or less direct
    mapping of the BSD socket API in a portable GObject based API. It supports
    both the UNIX socket implementations and winsock2 on Windows.

    [GSocket] is the platform independent base upon which the higher level
    network primitives are based. Applications are not typically meant to use it
    directly, but rather through classes like [Gio.SocketClient],
    [Gio.SocketService] and [Gio.SocketConnection]. However there may be cases
    where direct use of [GSocket] is useful.

    [GSocket] implements the [Gio.Initable] interface, so if it is manually
    constructed by e.g. [GObject.Object.new] you must call [Gio.Initable.init]
    and check the results before using the object. This is done automatically in
    [Gio.Socket.new] and [Gio.Socket.new_from_fd], so these functions can return
    [NULL].

    Sockets operate in two general modes, blocking or non-blocking. When in
    blocking mode all operations (which don’t take an explicit blocking
    parameter) block until the requested operation is finished or there is an
    error. In non-blocking mode all calls that would block return immediately
    with a [G_IO_ERROR_WOULD_BLOCK] error. To know when a call would
    successfully run you can call [Gio.Socket.condition_check], or
    [Gio.Socket.condition_wait]. You can also use [Gio.Socket.create_source] and
    attach it to a [GLib.MainContext] to get callbacks when I/O is possible.
    Note that all sockets are always set to non blocking mode in the system, and
    blocking mode is emulated in [GSocket].

    When working in non-blocking mode applications should always be able to
    handle getting a [G_IO_ERROR_WOULD_BLOCK] error even when some other
    function said that I/O was possible. This can easily happen in case of a
    race condition in the application, but it can also happen for other reasons.
    For instance, on Windows a socket is always seen as writable until a write
    returns [G_IO_ERROR_WOULD_BLOCK].

    [GSocket]s can be either connection oriented or datagram based. For
    connection oriented types you must first establish a connection by either
    connecting to an address or accepting a connection from another address. For
    connectionless socket types the target/source address is specified or
    received in each I/O operation.

    All socket file descriptors are set to be close-on-exec.

    Note that creating a [GSocket] causes the signal [SIGPIPE] to be ignored for
    the remainder of the program. If you are writing a command-line utility that
    uses [GSocket], you may need to take into account the fact that your program
    will not automatically be killed if it tries to write to [stdout] after it
    has been closed.

    Like most other APIs in GLib, [GSocket] is not inherently thread safe. To
    use a [GSocket] concurrently from multiple threads, you must implement your
    own locking.

    {b Nagle’s algorithm}

    Since GLib 2.80, [GSocket] will automatically set the [TCP_NODELAY] option
    on all [G_SOCKET_TYPE_STREAM] sockets. This disables
    {{:https://en.wikipedia.org/wiki/Nagle%27s_algorithm}Nagle’s algorithm} as
    it typically does more harm than good on modern networks.

    If your application needs Nagle’s algorithm enabled, call
    [Gio.Socket.set_option] after constructing a [GSocket] to enable it:

    {[
    socket = g_socket_new (…, G_SOCKET_TYPE_STREAM, …);
    if (socket != NULL)
      {
        g_socket_set_option (socket, IPPROTO_TCP, TCP_NODELAY, FALSE, &local_error);
        // handle error if needed
      }
    ]}

    Its methods, signals and properties are on {!class-type-socket_t}. The
    functions it is built on are in {!Ocgio.Raw.Socket}. *)

class type socket_t = Socket_and__socket_connection.socket_t
(** The methods, signals and properties of a [GSocket]. *)

class socket : Raw.Socket.t -> socket_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GSocket], give one already wrapped. *)

val new_ :
  Enums.socketfamily ->
  Enums.sockettype ->
  Enums.socketprotocol ->
  (socket_t, GError.t) result

val new_from_fd : int -> (socket_t, GError.t) result
