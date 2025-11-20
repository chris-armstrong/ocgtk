(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Box *)

type t = Gtk.Widget.t

(** Create a new Box *)
external new_ : Gtk_enums.orientation -> int -> t = "ml_gtk_box_new"

(* Properties *)

(** Get property: baseline-child *)
external get_baseline_child : t -> int = "ml_gtk_box_get_baseline_child"

(** Set property: baseline-child *)
external set_baseline_child : t -> int -> unit = "ml_gtk_box_set_baseline_child"

(** Get property: homogeneous *)
external get_homogeneous : t -> bool = "ml_gtk_box_get_homogeneous"

(** Set property: homogeneous *)
external set_homogeneous : t -> bool -> unit = "ml_gtk_box_set_homogeneous"

(** Get property: spacing *)
external get_spacing : t -> int = "ml_gtk_box_get_spacing"

(** Set property: spacing *)
external set_spacing : t -> int -> unit = "ml_gtk_box_set_spacing"

external set_baseline_position : t -> Gtk_enums.baselineposition -> unit = "ml_gtk_box_set_baseline_position"

external reorder_child_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_box_reorder_child_after"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_box_remove"

external prepend : t -> Gtk.Widget.t -> unit = "ml_gtk_box_prepend"

external insert_child_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_box_insert_child_after"

external get_baseline_position : t -> Gtk_enums.baselineposition = "ml_gtk_box_get_baseline_position"

external append : t -> Gtk.Widget.t -> unit = "ml_gtk_box_append"

