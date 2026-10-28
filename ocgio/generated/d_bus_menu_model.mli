(** [GDBusMenuModel] is an implementation of [Gio.MenuModel] that can be used as
    a proxy for a menu model that is exported over D-Bus with
    [Gio.DBusConnection.export_menu_model].

    Its methods, signals and properties are on {!class-type-d_bus_menu_model_t}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_menu_model}. *)

(** {b The methods, signals and properties of a [DBusMenuModel].}

    [GDBusMenuModel] is an implementation of [Gio.MenuModel] that can be used as
    a proxy for a menu model that is exported over D-Bus with
    [Gio.DBusConnection.export_menu_model]. *)
class type d_bus_menu_model_t = object
  inherit Menu_link_iter_and__menu_model.menu_model_t
  method as_d_bus_menu_model : Raw.D_bus_menu_model.t
end

class d_bus_menu_model : Raw.D_bus_menu_model.t -> d_bus_menu_model_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_menu_model.t}. *)
