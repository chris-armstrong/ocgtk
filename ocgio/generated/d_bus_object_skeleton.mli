(** A [GDBusObjectSkeleton] instance is essentially a group of D-Bus interfaces.
    The set of exported interfaces on the object may be dynamic and change at
    runtime.

    This type is intended to be used with [Gio.DBusObjectManager].

    Its methods, signals and properties are on
    {!class-type-d_bus_object_skeleton_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_object_skeleton}. *)

(** The methods, signals and properties of a [GDBusObjectSkeleton]. *)
class type d_bus_object_skeleton_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_object_t

  method on_authorize_method :
    ?after:bool ->
    callback:
      (interface:D_bus_interface_skeleton.d_bus_interface_skeleton_t ->
      invocation:D_bus_method_invocation.d_bus_method_invocation_t ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method add_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit

  method flush : unit -> unit

  method remove_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit

  method remove_interface_by_name : string -> unit
  method set_object_path : string -> unit
  method g_object_path : string
  method set_g_object_path : string -> unit
  method as_d_bus_object_skeleton : Raw.D_bus_object_skeleton.t
end

class d_bus_object_skeleton :
  Raw.D_bus_object_skeleton.t ->
  d_bus_object_skeleton_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_object_skeleton.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDBusObjectSkeleton], give one already wrapped. *)

val new_ : string -> d_bus_object_skeleton_t
