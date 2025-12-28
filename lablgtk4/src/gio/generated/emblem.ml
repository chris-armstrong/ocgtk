(* GENERATED CODE - DO NOT EDIT *)
(* Emblem: Emblem *)

type t = [`emblem | `object_] Gobject.obj

(** Create a new Emblem *)
external new_ : Icon.t -> t = "ml_g_emblem_new"

(** Create a new Emblem *)
external new_with_origin : Icon.t -> Gio_enums.emblemorigin -> t = "ml_g_emblem_new_with_origin"

(* Methods *)
(** Gets the origin of the emblem. *)
external get_origin : t -> Gio_enums.emblemorigin = "ml_g_emblem_get_origin"

(** Gives back the icon from @emblem. *)
external get_icon : t -> Icon.t = "ml_g_emblem_get_icon"

(* Properties *)

