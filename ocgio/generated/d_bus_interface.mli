(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for DBusInterface from cyclic group D_bus_interface_and__d_bus_object *)

(** Base type for D-Bus interfaces.

    Its methods, signals and properties are on {!class-type-d_bus_interface_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgio.Raw.D_bus_interface}. *)

(** {1:class Class} *)

class type d_bus_interface_t =
  D_bus_interface_and__d_bus_object.d_bus_interface_t
(** {b The methods, signals and properties of a [DBusInterface].}

    Base type for D-Bus interfaces.

    The [GDBusInterface] type is the base type for D-Bus interfaces both on the
    service side (see [Gio.DBusInterfaceSkeleton]) and client side (see
    [Gio.DBusProxy]). *)

class d_bus_interface : Raw.D_bus_interface.t -> d_bus_interface_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_interface.t}. *)

(** {1:description Description}

    Base type for D-Bus interfaces.

    The [GDBusInterface] type is the base type for D-Bus interfaces both on the
    service side (see [Gio.DBusInterfaceSkeleton]) and client side (see
    [Gio.DBusProxy]). *)
