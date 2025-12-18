(* GENERATED CODE - DO NOT EDIT *)
(* Layout manager: BoxLayout *)

type t = [`box_layout | `layout_manager | `object_] Gobject.obj

val as_layoutmanager : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t

(** Create a new BoxLayout *)
external new_ : Gtk_enums.orientation -> t = "ml_gtk_box_layout_new"

(* Properties *)

(** Get property: baseline-child *)
external get_baseline_child : t -> int = "ml_gtk_box_layout_get_baseline_child"

(** Set property: baseline-child *)
external set_baseline_child : t -> int -> unit = "ml_gtk_box_layout_set_baseline_child"

(** Get property: homogeneous *)
external get_homogeneous : t -> bool = "ml_gtk_box_layout_get_homogeneous"

(** Set property: homogeneous *)
external set_homogeneous : t -> bool -> unit = "ml_gtk_box_layout_set_homogeneous"

(** Get property: spacing *)
external get_spacing : t -> int = "ml_gtk_box_layout_get_spacing"

(** Set property: spacing *)
external set_spacing : t -> int -> unit = "ml_gtk_box_layout_set_spacing"

(** Sets the baseline position of a box layout.

The baseline position affects only horizontal boxes with at least one
baseline aligned child. If there is more vertical space available than
requested, and the baseline is not allocated by the parent then the
given @position is used to allocate the baseline within the extra
space available. *)
external set_baseline_position : t -> Gtk_enums.baselineposition -> unit = "ml_gtk_box_layout_set_baseline_position"

(** Gets the value set by gtk_box_layout_set_baseline_position(). *)
external get_baseline_position : t -> Gtk_enums.baselineposition = "ml_gtk_box_layout_get_baseline_position"

