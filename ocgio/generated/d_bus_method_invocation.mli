(** Instances of the [GDBusMethodInvocation] class are used when handling D-Bus
    method calls. It provides a way to asynchronously return results and errors.

    The normal way to obtain a [GDBusMethodInvocation] object is to receive it
    as an argument to the [handle_method_call()] function in a
    [Gio.DBusInterfaceVTable] that was passed to
    [Gio.DBusConnection.register_object].

    Its methods, signals and properties are on
    {!class-type-d_bus_method_invocation_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_method_invocation}. *)

(** The methods, signals and properties of a [GDBusMethodInvocation]. *)
class type d_bus_method_invocation_t = object
  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  method get_interface_name : unit -> string option
  method get_message : unit -> D_bus_message.d_bus_message_t
  method get_method_info : unit -> Raw.D_bus_method_info.t option
  method get_method_name : unit -> string
  method get_object_path : unit -> string
  method get_parameters : unit -> Gvariant.t
  method get_property_info : unit -> Raw.D_bus_property_info.t option
  method get_sender : unit -> string option
  method return_dbus_error : string -> string -> unit
  method return_gerror : GError.t -> unit
  method return_value : Gvariant.t option -> unit

  method return_value_with_unix_fd_list :
    Gvariant.t option -> Unix_fd_list.unix_fd_list_t option -> unit

  method as_d_bus_method_invocation : Raw.D_bus_method_invocation.t
end

class d_bus_method_invocation :
  Raw.D_bus_method_invocation.t ->
  d_bus_method_invocation_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_method_invocation.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDBusMethodInvocation], give one already wrapped. *)
