(* GENERATED CODE - DO NOT EDIT *)
(* EmblemedIcon: EmblemedIcon *)

type t = [`emblemed_icon | `object_] Gobject.obj

(** Create a new EmblemedIcon *)
external new_ : unit -> Emblem.t option -> t = "ml_g_emblemed_icon_new"

(* Methods *)
(** Removes all the emblems from @icon. *)
external clear_emblems : t -> unit = "ml_g_emblemed_icon_clear_emblems"

(** Adds @emblem to the #GList of #GEmblems. *)
external add_emblem : t -> Emblem.t -> unit = "ml_g_emblemed_icon_add_emblem"

(* Properties *)

