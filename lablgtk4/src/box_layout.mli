(* GENERATED CODE - DO NOT EDIT *)
(* Widget: BoxLayout *)

type t = Gtk.Widget.t

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

external set_baseline_position : t -> Gtk_enums.baselineposition -> unit = "ml_gtk_box_layout_set_baseline_position"

external get_baseline_position : t -> Gtk_enums.baselineposition = "ml_gtk_box_layout_get_baseline_position"

