(* GENERATED CODE - DO NOT EDIT *)
(* OverlayLayoutChild: OverlayLayoutChild *)

type t = [`overlay_layout_child | `layout_child | `object_] Gobject.obj

(* Properties *)

(** Sets whether to measure this child. *)
external set_measure : t -> bool -> unit = "ml_gtk_overlay_layout_child_set_measure"

(** Sets whether to clip this child. *)
external set_clip_overlay : t -> bool -> unit = "ml_gtk_overlay_layout_child_set_clip_overlay"

(** Retrieves whether the child is measured. *)
external get_measure : t -> bool = "ml_gtk_overlay_layout_child_get_measure"

(** Retrieves whether the child is clipped. *)
external get_clip_overlay : t -> bool = "ml_gtk_overlay_layout_child_get_clip_overlay"

