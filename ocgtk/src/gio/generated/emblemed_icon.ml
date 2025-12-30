(* GENERATED CODE - DO NOT EDIT *)
(* EmblemedIcon: EmblemedIcon *)

type t = [`emblemed_icon | `object_] Gobject.obj

(** Create a new EmblemedIcon *)
external new_ : Icon.t -> Emblem.t option -> t = "ml_g_emblemed_icon_new"

(* Methods *)
(** Gets the main icon for @emblemed. *)
external get_icon : t -> Icon.t = "ml_g_emblemed_icon_get_icon"

(** Removes all the emblems from @icon. *)
external clear_emblems : t -> unit = "ml_g_emblemed_icon_clear_emblems"

(** Adds @emblem to the #GList of #GEmblems. *)
external add_emblem : t -> Emblem.t -> unit = "ml_g_emblemed_icon_add_emblem"

(* Properties *)

