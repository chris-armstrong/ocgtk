(** [GDBusMenuModel] is an implementation of [Gio.MenuModel] that can be used as
    a proxy for a menu model that is exported over D-Bus with
    [Gio.DBusConnection.export_menu_model].

    Its methods, signals and properties are on {!class-type-d_bus_menu_model_t}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_menu_model}. *)

(** The methods, signals and properties of a [GDBusMenuModel]. *)
class type d_bus_menu_model_t = object
  inherit Menu_link_iter_and__menu_model.menu_model_t
  method as_d_bus_menu_model : Raw.D_bus_menu_model.t
end

class d_bus_menu_model : Raw.D_bus_menu_model.t -> d_bus_menu_model_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_menu_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusMenuModel], give one already wrapped. *)
