(* GENERATED CODE - DO NOT EDIT *)
(* Emblem: Emblem *)

(** [GEmblem] is an implementation of [Gio.Icon] that supports having an emblem,
    which is an icon with additional properties. It can than be added to a
    [Gio.EmblemedIcon].

    Currently, only metainformation about the emblem's origin is supported. More
    may be added in the future.

    The class built on this module is in {!Ocgio.Emblem}. *)

type t = [ `emblem | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_emblem_get_type"

external new_ : Icon.t -> t = "ml_g_emblem_new"
(** Creates a new emblem for [icon]. *)

external new_with_origin : Icon.t -> Ocgio_enums.emblemorigin -> t
  = "ml_g_emblem_new_with_origin"
(** Creates a new emblem for [icon]. *)

(* Methods *)

external get_origin : t -> Ocgio_enums.emblemorigin = "ml_g_emblem_get_origin"
(** Gets the origin of the emblem. *)

external get_icon : t -> Icon.t = "ml_g_emblem_get_icon"
(** Gives back the icon from [emblem]. *)

(* Properties *)
