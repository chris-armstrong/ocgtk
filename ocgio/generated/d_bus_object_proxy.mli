(** A [GDBusObjectProxy] is an object used to represent a remote object with one
    or more D-Bus interfaces. Normally, you don’t instantiate a
    [GDBusObjectProxy] yourself — typically [Gio.DBusObjectManagerClient] is
    used to obtain it.

    Its methods, signals and properties are on
    {!class-type-d_bus_object_proxy_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_object_proxy}. *)

(** The methods, signals and properties of a [DBusObjectProxy]. *)
class type d_bus_object_proxy_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_object_t

  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  (** Gets the connection that [proxy] is for. *)

  method g_connection : D_bus_connection.d_bus_connection_t
  (** The connection of the proxy. *)

  method g_object_path : string
  (** The object path of the proxy. *)

  method as_d_bus_object_proxy : Raw.D_bus_object_proxy.t
end

class d_bus_object_proxy : Raw.D_bus_object_proxy.t -> d_bus_object_proxy_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_object_proxy.t}. *)

(** {2:constructors Constructors} *)

val new_ : D_bus_connection.d_bus_connection_t -> string -> d_bus_object_proxy_t
(** Creates a new [GDBusObjectProxy] for the given connection and object path.
*)
