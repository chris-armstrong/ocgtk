(** A [GDBusObjectSkeleton] instance is essentially a group of D-Bus interfaces.
    The set of exported interfaces on the object may be dynamic and change at
    runtime.

    Its methods, signals and properties are on
    {!class-type-d_bus_object_skeleton_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_object_skeleton}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusObjectSkeleton].}

    Implements:
    - {{!Ocgio.D_bus_object.class-type-d_bus_object_t}Ocgio.D_bus_object}

    A [GDBusObjectSkeleton] instance is essentially a group of D-Bus interfaces.
    The set of exported interfaces on the object may be dynamic and change at
    runtime.

    This type is intended to be used with
    {{!Ocgio.D_bus_object_manager.class-type-d_bus_object_manager_t}[Gio.DBusObjectManager]}.
*)
class type d_bus_object_skeleton_t = object
  inherit D_bus_object.d_bus_object_t

  (** {2:signals Signals} *)

  method on_authorize_method :
    ?after:bool ->
    callback:
      (interface:D_bus_interface_skeleton.d_bus_interface_skeleton_t ->
      invocation:D_bus_method_invocation.d_bus_method_invocation_t ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a method is invoked by a remote caller and used to determine
      if the method call is authorized.

      This signal is like [GDBusInterfaceSkeleton]'s
      [GDBusInterfaceSkeleton::g-authorize-method] signal, except that it is for
      the enclosing object.

      The default class handler just returns [true]. *)

  (** {2:methods Methods} *)

  method add_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit
  (** Adds [interface_] to [object].

      If [object] already contains a [GDBusInterfaceSkeleton] with the same
      interface name, it is removed before [interface_] is added.

      Note that [object] takes its own reference on [interface_] and holds it
      until removed. *)

  method flush : unit -> unit
  (** This method simply calls [g_dbus_interface_skeleton_flush ()] on all
      interfaces belonging to [object]. See that method for when flushing is
      useful. *)

  method remove_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit
  (** Removes [interface_] from [object]. *)

  method remove_interface_by_name : string -> unit
  (** Removes the [GDBusInterface] with [interface_name] from [object].

      If no D-Bus interface of the given interface exists, this function does
      nothing. *)

  method set_object_path : string -> unit
  (** Sets the object path for [object]. *)

  (** {2:properties Properties} *)

  method g_object_path : string
  (** The object path where the object is exported. *)

  method set_g_object_path : string -> unit
  (** The object path where the object is exported. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_object_skeleton : Raw.D_bus_object_skeleton.t
end

class d_bus_object_skeleton :
  Raw.D_bus_object_skeleton.t ->
  d_bus_object_skeleton_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_object_skeleton.t}. *)

(** {1:description Description}

    A [GDBusObjectSkeleton] instance is essentially a group of D-Bus interfaces.
    The set of exported interfaces on the object may be dynamic and change at
    runtime.

    This type is intended to be used with
    {{!Ocgio.D_bus_object_manager.class-type-d_bus_object_manager_t}[Gio.DBusObjectManager]}.
*)

(** {1:constructors Constructors} *)

val new_ : string -> d_bus_object_skeleton_t
(** Creates a new
    {{!Ocgio.D_bus_object_skeleton.class-type-d_bus_object_skeleton_t}[GDBusObjectSkeleton]}.
*)
