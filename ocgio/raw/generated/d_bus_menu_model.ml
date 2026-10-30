(* GENERATED CODE - DO NOT EDIT *)
(* DBusMenuModel: DBusMenuModel *)

(** [GDBusMenuModel] is an implementation of
    {{!Ocgio.Raw.Menu_model}[Gio.MenuModel]} that can be used as a proxy for a
    menu model that is exported over D-Bus with
    {{!Ocgio.Raw.D_bus_connection.val-export_menu_model}[Gio.DBusConnection.export_menu_model]}.

    The class built on this module is in {!Ocgio.D_bus_menu_model}. *)

type t = [ `d_bus_menu_model | `menu_model | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_menu_model_get_type"

(* Methods *)
