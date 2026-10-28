(** Abstract base class for D-Bus interfaces on the service side.

    Its methods, signals and properties are on
    {!class-type-d_bus_interface_skeleton_t}. The functions it is built on are
    in {!Ocgio.Raw.D_bus_interface_skeleton}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusInterfaceSkeleton].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.D_bus_interface.class-type-d_bus_interface_t}Ocgio.D_bus_interface}

    Abstract base class for D-Bus interfaces on the service side. *)
class type d_bus_interface_skeleton_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_interface_t

  (** {2:signals Signals} *)

  method on_g_authorize_method :
    ?after:bool ->
    callback:
      (invocation:D_bus_method_invocation.d_bus_method_invocation_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a method is invoked by a remote caller and used to determine
      if the method call is authorized.

      Note that this signal is emitted in a thread dedicated to handling the
      method call so handlers are allowed to perform blocking IO. This means
      that it is appropriate to call e.g.
      polkit_authority_check_authorization_sync() with the
      POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION flag set.

      If [FALSE] is returned then no further handlers are run and the signal
      handler must take a reference to [invocation] and finish handling the call
      (e.g. return an error via g_dbus_method_invocation_return_error()).

      Otherwise, if [TRUE] is returned, signal emission continues. If no
      handlers return [FALSE], then the method is dispatched. If [interface] has
      an enclosing [GDBusObjectSkeleton], then the
      [GDBusObjectSkeleton::authorize]-method signal handlers run before the
      handlers for this signal.

      The default class handler just returns [TRUE].

      Please note that the common case is optimized: if no signals handlers are
      connected and the default class handler isn't overridden (for both
      [interface] and the enclosing [GDBusObjectSkeleton], if any) and
      [GDBusInterfaceSkeleton:g]-flags does not have the
      [G_DBUS_INTERFACE_SKELETON_FLAGS_HANDLE_METHOD_INVOCATIONS_IN_THREAD]
      flags set, no dedicated thread is ever used and the call will be handled
      in the same thread as the object that [interface] belongs to was exported
      in. *)

  (** {2:methods Methods} *)

  method export :
    D_bus_connection.d_bus_connection_t -> string -> (bool, GError.t) result
  (** Exports [interface_] at [object_path] on [connection].

      This can be called multiple times to export the same [interface_] onto
      multiple connections however the [object_path] provided must be the same
      for all connections.

      Use g_dbus_interface_skeleton_unexport() to unexport the object. *)

  method flush : unit -> unit
  (** If [interface_] has outstanding changes, request for these changes to be
      emitted immediately.

      For example, an exported D-Bus interface may queue up property changes and
      emit the [org.freedesktop.DBus.Properties.PropertiesChanged] signal later
      (e.g. in an idle handler). This technique is useful for collapsing
      multiple property changes into one. *)

  method get_connection : unit -> D_bus_connection.d_bus_connection_t option
  (** Gets the first connection that [interface_] is exported on, if any. *)

  method get_connections : unit -> D_bus_connection.d_bus_connection_t list
  (** Gets a list of the connections that [interface_] is exported on. *)

  method get_flags : unit -> Enums.dbusinterfaceskeletonflags
  (** Gets the [GDBusInterfaceSkeletonFlags] that describes what the behavior of
      [interface_] *)

  method get_object_path : unit -> string option
  (** Gets the object path that [interface_] is exported on, if any. *)

  method get_properties : unit -> Gvariant.t
  (** Gets all D-Bus properties for [interface_]. *)

  method get_vtable : unit -> Raw.D_bus_interface_v_table.t
  (** Gets the interface vtable for the D-Bus interface implemented by
      [interface_]. The returned function pointers should expect [interface_]
      itself to be passed as [user_data]. *)

  method has_connection : D_bus_connection.d_bus_connection_t -> bool
  (** Checks if [interface_] is exported on [connection]. *)

  method set_flags : Enums.dbusinterfaceskeletonflags -> unit
  (** Sets flags describing what the behavior of [skeleton] should be. *)

  method unexport : unit -> unit
  (** Stops exporting [interface_] on all connections it is exported on.

      To unexport [interface_] from only a single connection, use
      g_dbus_interface_skeleton_unexport_from_connection() *)

  method unexport_from_connection : D_bus_connection.d_bus_connection_t -> unit
  (** Stops exporting [interface_] on [connection].

      To stop exporting on all connections the interface is exported on, use
      g_dbus_interface_skeleton_unexport(). *)

  (** {2:properties Properties} *)

  method g_flags : Enums.dbusinterfaceskeletonflags
  (** Flags from the [GDBusInterfaceSkeletonFlags] enumeration. *)

  method set_g_flags : Enums.dbusinterfaceskeletonflags -> unit
  (** Flags from the [GDBusInterfaceSkeletonFlags] enumeration. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_interface_skeleton : Raw.D_bus_interface_skeleton.t
end

class d_bus_interface_skeleton :
  Raw.D_bus_interface_skeleton.t ->
  d_bus_interface_skeleton_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_interface_skeleton.t}. *)
