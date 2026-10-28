(* GENERATED CODE - DO NOT EDIT *)
(* FixedLayoutChild: FixedLayoutChild *)

(** [GtkLayoutChild] subclass for children in a [GtkFixedLayout].

    The class built on this module is in {!Ocgtk.Fixed_layout_child}. *)

type t = [ `fixed_layout_child | `layout_child | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_fixed_layout_child_get_type"

(* Methods *)

external set_transform : t -> Ocgsk_raw.Transform.t -> unit
  = "ml_gtk_fixed_layout_child_set_transform"
(** Sets the transformation of the child of a [GtkFixedLayout]. *)

external get_transform : t -> Ocgsk_raw.Transform.t option
  = "ml_gtk_fixed_layout_child_get_transform"
(** Retrieves the transformation of the child. *)

(* Properties *)
