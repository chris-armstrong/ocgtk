(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GridLayout *)

type t = Gtk.widget

(** Create a new GridLayout *)
external new_ : unit -> t = "ml_gtk_grid_layout_new"

(* Properties *)

(** Get property: baseline-row *)
external get_baseline_row : t -> int = "ml_gtk_grid_layout_get_baseline_row"

(** Set property: baseline-row *)
external set_baseline_row : t -> int -> unit = "ml_gtk_grid_layout_set_baseline_row"

(** Get property: column-homogeneous *)
external get_column_homogeneous : t -> bool = "ml_gtk_grid_layout_get_column_homogeneous"

(** Set property: column-homogeneous *)
external set_column_homogeneous : t -> bool -> unit = "ml_gtk_grid_layout_set_column_homogeneous"

(** Get property: column-spacing *)
external get_column_spacing : t -> int = "ml_gtk_grid_layout_get_column_spacing"

(** Set property: column-spacing *)
external set_column_spacing : t -> int -> unit = "ml_gtk_grid_layout_set_column_spacing"

(** Get property: row-homogeneous *)
external get_row_homogeneous : t -> bool = "ml_gtk_grid_layout_get_row_homogeneous"

(** Set property: row-homogeneous *)
external set_row_homogeneous : t -> bool -> unit = "ml_gtk_grid_layout_set_row_homogeneous"

(** Get property: row-spacing *)
external get_row_spacing : t -> int = "ml_gtk_grid_layout_get_row_spacing"

(** Set property: row-spacing *)
external set_row_spacing : t -> int -> unit = "ml_gtk_grid_layout_set_row_spacing"

external set_row_baseline_position : t -> int -> Gtk_enums.baselineposition -> unit = "ml_gtk_grid_layout_set_row_baseline_position"

external get_row_baseline_position : t -> int -> Gtk_enums.baselineposition = "ml_gtk_grid_layout_get_row_baseline_position"

