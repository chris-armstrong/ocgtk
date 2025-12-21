(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec D_bus_interface : sig
  type t = [`d_bus_interface] Gobject.obj

  (* Methods *)
  (** Gets D-Bus introspection information for the D-Bus interface
  implemented by @interface_. *)
  external get_info : t -> D_bus_interface_info.t = "ml_g_dbus_interface_get_info"


end = struct
  type t = [`d_bus_interface] Gobject.obj

  (* Methods *)
  (** Gets D-Bus introspection information for the D-Bus interface
  implemented by @interface_. *)
  external get_info : t -> D_bus_interface_info.t = "ml_g_dbus_interface_get_info"


end

and D_bus_object
 : sig
  type t = [`d_bus_object] Gobject.obj

  (* Methods *)
  (** Gets the object path for @object. *)
  external get_object_path : t -> string = "ml_g_dbus_object_get_object_path"


end = struct
  type t = [`d_bus_object] Gobject.obj

  (* Methods *)
  (** Gets the object path for @object. *)
  external get_object_path : t -> string = "ml_g_dbus_object_get_object_path"


end
