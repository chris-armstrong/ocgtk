(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec D_bus_interface : sig
  type t = [`d_bus_interface] Gobject.obj

  (* Methods *)
  (** Sets the #GDBusObject for @interface_ to @object.

  Note that @interface_ will hold a weak reference to @object. *)
  external set_object : t -> D_bus_object.t option -> unit = "ml_g_dbus_interface_set_object"

  (** Gets the #GDBusObject that @interface_ belongs to, if any.

  It is not safe to use the returned object if @interface_ or
  the returned object is being used from other threads. See
  g_dbus_interface_dup_object() for a thread-safe alternative. *)
  external get_object : t -> D_bus_object.t option = "ml_g_dbus_interface_get_object"

  (** Gets D-Bus introspection information for the D-Bus interface
  implemented by @interface_. *)
  external get_info : t -> D_bus_interface_info.t = "ml_g_dbus_interface_get_info"

  (** Gets the #GDBusObject that @interface_ belongs to, if any. *)
  external dup_object : t -> D_bus_object.t option = "ml_g_dbus_interface_dup_object"


end = struct
  type t = [`d_bus_interface] Gobject.obj

  (* Methods *)
  (** Sets the #GDBusObject for @interface_ to @object.

  Note that @interface_ will hold a weak reference to @object. *)
  external set_object : t -> D_bus_object.t option -> unit = "ml_g_dbus_interface_set_object"

  (** Gets the #GDBusObject that @interface_ belongs to, if any.

  It is not safe to use the returned object if @interface_ or
  the returned object is being used from other threads. See
  g_dbus_interface_dup_object() for a thread-safe alternative. *)
  external get_object : t -> D_bus_object.t option = "ml_g_dbus_interface_get_object"

  (** Gets D-Bus introspection information for the D-Bus interface
  implemented by @interface_. *)
  external get_info : t -> D_bus_interface_info.t = "ml_g_dbus_interface_get_info"

  (** Gets the #GDBusObject that @interface_ belongs to, if any. *)
  external dup_object : t -> D_bus_object.t option = "ml_g_dbus_interface_dup_object"


end

and D_bus_object
 : sig
  type t = [`d_bus_object] Gobject.obj

  (* Methods *)
  (** Gets the object path for @object. *)
  external get_object_path : t -> string = "ml_g_dbus_object_get_object_path"

  (** Gets the D-Bus interface with name @interface_name associated with
  @object, if any. *)
  external get_interface : t -> string -> D_bus_interface.t option = "ml_g_dbus_object_get_interface"


end = struct
  type t = [`d_bus_object] Gobject.obj

  (* Methods *)
  (** Gets the object path for @object. *)
  external get_object_path : t -> string = "ml_g_dbus_object_get_object_path"

  (** Gets the D-Bus interface with name @interface_name associated with
  @object, if any. *)
  external get_interface : t -> string -> D_bus_interface.t option = "ml_g_dbus_object_get_interface"


end
