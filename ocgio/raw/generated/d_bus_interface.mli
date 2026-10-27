(* GENERATED CODE - DO NOT EDIT *)
(* DBusInterface, a member of the cyclic module D_bus_interface_and__d_bus_object *)

(** Base type for D-Bus interfaces.

    The [GDBusInterface] type is the base type for D-Bus interfaces both on the
    service side (see [Gio.DBusInterfaceSkeleton]) and client side (see
    [Gio.DBusProxy]).

    The class built on this module is in {!Ocgio.D_bus_interface}. *)

include module type of struct
  include D_bus_interface_and__d_bus_object.D_bus_interface
end
