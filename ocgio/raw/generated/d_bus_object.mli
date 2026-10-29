(* GENERATED CODE - DO NOT EDIT *)
(* DBusObject, a member of the cyclic module D_bus_interface_and__d_bus_object *)

(** The [GDBusObject] type is the base type for D-Bus objects on both the
    service side (see
    {{!Ocgio.Raw.D_bus_object_skeleton}[Gio.DBusObjectSkeleton]}) and the client
    side (see {{!Ocgio.Raw.D_bus_object_proxy}[Gio.DBusObjectProxy]}). It is
    essentially just a container of interfaces.

    The class built on this module is in {!Ocgio.D_bus_object}. *)

include module type of struct
  include D_bus_interface_and__d_bus_object.D_bus_object
end
