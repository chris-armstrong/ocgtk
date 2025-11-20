(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Grid *)

type t = Gtk.Widget.t

(** Create a new Grid *)
external new_ : unit -> t = "ml_gtk_grid_new"

(* Properties *)

(** Get property: baseline-row *)
external get_baseline_row : t -> int = "ml_gtk_grid_get_baseline_row"

(** Set property: baseline-row *)
external set_baseline_row : t -> int -> unit = "ml_gtk_grid_set_baseline_row"

(** Get property: column-homogeneous *)
external get_column_homogeneous : t -> bool = "ml_gtk_grid_get_column_homogeneous"

(** Set property: column-homogeneous *)
external set_column_homogeneous : t -> bool -> unit = "ml_gtk_grid_set_column_homogeneous"

(** Get property: column-spacing *)
external get_column_spacing : t -> int = "ml_gtk_grid_get_column_spacing"

(** Set property: column-spacing *)
external set_column_spacing : t -> int -> unit = "ml_gtk_grid_set_column_spacing"

(** Get property: row-homogeneous *)
external get_row_homogeneous : t -> bool = "ml_gtk_grid_get_row_homogeneous"

(** Set property: row-homogeneous *)
external set_row_homogeneous : t -> bool -> unit = "ml_gtk_grid_set_row_homogeneous"

(** Get property: row-spacing *)
external get_row_spacing : t -> int = "ml_gtk_grid_get_row_spacing"

(** Set property: row-spacing *)
external set_row_spacing : t -> int -> unit = "ml_gtk_grid_set_row_spacing"

external set_row_baseline_position : t -> int -> Gtk_enums.baselineposition -> unit = "ml_gtk_grid_set_row_baseline_position"

external remove_row : t -> int -> unit = "ml_gtk_grid_remove_row"

external remove_column : t -> int -> unit = "ml_gtk_grid_remove_column"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_grid_remove"

external query_child : t -> Gtk.Widget.t -> int -> int -> int -> int -> unit = "ml_gtk_grid_query_child_bytecode" "ml_gtk_grid_query_child_native"

external insert_row : t -> int -> unit = "ml_gtk_grid_insert_row"

external insert_next_to : t -> Gtk.Widget.t -> Gtk_enums.positiontype -> unit = "ml_gtk_grid_insert_next_to"

external insert_column : t -> int -> unit = "ml_gtk_grid_insert_column"

external get_row_baseline_position : t -> int -> Gtk_enums.baselineposition = "ml_gtk_grid_get_row_baseline_position"

external get_child_at : t -> int -> int -> Gtk.Widget.t = "ml_gtk_grid_get_child_at"

external attach_next_to : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk_enums.positiontype -> int -> int -> unit = "ml_gtk_grid_attach_next_to_bytecode" "ml_gtk_grid_attach_next_to_native"

external attach : t -> Gtk.Widget.t -> int -> int -> int -> int -> unit = "ml_gtk_grid_attach_bytecode" "ml_gtk_grid_attach_native"

