(* GENERATED CODE - DO NOT EDIT *)
(* LoadableIcon: LoadableIcon *)

(** [GLoadableIcon] extends the [Gio.Icon] interface and adds the ability to
    load icons from streams. *)

type t = [ `loadable_icon ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_loadable_icon_from_gobject"

(* Methods *)
