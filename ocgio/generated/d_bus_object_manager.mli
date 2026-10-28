(** The [GDBusObjectManager] type is the base type for service- and client-side
    implementations of the standardized [org.freedesktop.DBus.ObjectManager]
    interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_object_manager_t}. Its full description is under
    {!section-description}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_object_manager}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusObjectManager].}

    The [GDBusObjectManager] type is the base type for service- and client-side
    implementations of the standardized [org.freedesktop.DBus.ObjectManager]
    interface.

    See [Gio.DBusObjectManagerClient] for the client-side implementation and
    [Gio.DBusObjectManagerServer] for the service-side implementation. *)
class type d_bus_object_manager_t = object
  (** {2:signals Signals} *)

  method on_interface_added :
    ?after:bool ->
    callback:
      (object_:D_bus_interface_and__d_bus_object.d_bus_object_t ->
      interface:D_bus_interface_and__d_bus_object.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is added to [object].

      This signal exists purely as a convenience to avoid having to connect
      signals to all objects managed by [manager]. *)

  method on_interface_removed :
    ?after:bool ->
    callback:
      (object_:D_bus_interface_and__d_bus_object.d_bus_object_t ->
      interface:D_bus_interface_and__d_bus_object.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] has been removed from [object].

      This signal exists purely as a convenience to avoid having to connect
      signals to all objects managed by [manager]. *)

  method on_object_added :
    ?after:bool ->
    callback:(object_:D_bus_interface_and__d_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [object] is added to [manager]. *)

  method on_object_removed :
    ?after:bool ->
    callback:(object_:D_bus_interface_and__d_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [object] is removed from [manager]. *)

  (** {2:methods Methods} *)

  method get_interface :
    string ->
    string ->
    D_bus_interface_and__d_bus_object.d_bus_interface_t option
  (** Gets the interface proxy for [interface_name] at [object_path], if any. *)

  method get_object :
    string -> D_bus_interface_and__d_bus_object.d_bus_object_t option
  (** Gets the [GDBusObject] at [object_path], if any. *)

  method get_object_path : unit -> string
  (** Gets the object path that [manager] is for. *)

  method get_objects :
    unit -> D_bus_interface_and__d_bus_object.d_bus_object_t list
  (** Gets all [GDBusObject] objects known to [manager]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_object_manager : Raw.D_bus_object_manager.t
end

class d_bus_object_manager :
  Raw.D_bus_object_manager.t ->
  d_bus_object_manager_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_object_manager.t}. *)

(** {1:description Description}

    The [GDBusObjectManager] type is the base type for service- and client-side
    implementations of the standardized [org.freedesktop.DBus.ObjectManager]
    interface.

    See [Gio.DBusObjectManagerClient] for the client-side implementation and
    [Gio.DBusObjectManagerServer] for the service-side implementation. *)
