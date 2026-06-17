(* GENERATED CODE - DO NOT EDIT *)
(* FixedLayoutChild: FixedLayoutChild *)

type t = [`fixed_layout_child | `layout_child | `object_] Gobject.obj

(* Methods *)
(** Sets the transformation of the child of a `GtkFixedLayout`. *)
external set_transform : t -> Ocgtk_gsk.Gsk.Wrappers.Transform.t -> unit = "ml_gtk_fixed_layout_child_set_transform"

(** Retrieves the transformation of the child. *)
external get_transform : t -> Ocgtk_gsk.Gsk.Wrappers.Transform.t option = "ml_gtk_fixed_layout_child_get_transform"

(* Properties *)

