(** A [GDBusObjectProxy] is an object used to represent a remote object with one
    or more D-Bus interfaces. Normally, you don’t instantiate a
    [GDBusObjectProxy] yourself — typically [Gio.DBusObjectManagerClient] is
    used to obtain it.

    Its methods, signals and properties are on
    {!class-type-d_bus_object_proxy_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_object_proxy}. *)

(** The methods, signals and properties of a [GDBusObjectProxy]. *)
class type d_bus_object_proxy_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_object_t

  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  (** Gets the connection that [proxy] is for. *)

  method g_connection : D_bus_connection.d_bus_connection_t
  method g_object_path : string
  method as_d_bus_object_proxy : Raw.D_bus_object_proxy.t
end

class d_bus_object_proxy : Raw.D_bus_object_proxy.t -> d_bus_object_proxy_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_object_proxy.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusObjectProxy], give one already wrapped. *)

val new_ : D_bus_connection.d_bus_connection_t -> string -> d_bus_object_proxy_t
