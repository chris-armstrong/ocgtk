(* GENERATED CODE - DO NOT EDIT *)
(* LoadableIcon: LoadableIcon *)

(** [GLoadableIcon] extends the {{!Ocgio.Raw.Icon}[Gio.Icon]} interface and adds
    the ability to load icons from streams.

    The class built on this module is in {!Ocgio.Loadable_icon}. *)

type t = [ `loadable_icon ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_loadable_icon_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_loadable_icon_from_gobject"

(* Methods *)
