(* GENERATED CODE - DO NOT EDIT *)
(* GridLayoutChild: GridLayoutChild *)

type t = [`grid_layout_child | `layout_child | `object_] Gobject.obj

(* Properties *)

(** Sets the number of rows @child spans to. *)
external set_row_span : t -> int -> unit = "ml_gtk_grid_layout_child_set_row_span"

(** Sets the row to place @child in. *)
external set_row : t -> int -> unit = "ml_gtk_grid_layout_child_set_row"

(** Sets the number of columns @child spans to. *)
external set_column_span : t -> int -> unit = "ml_gtk_grid_layout_child_set_column_span"

(** Sets the column number to attach the left side of @child. *)
external set_column : t -> int -> unit = "ml_gtk_grid_layout_child_set_column"

(** Retrieves the number of rows that @child spans to. *)
external get_row_span : t -> int = "ml_gtk_grid_layout_child_get_row_span"

(** Retrieves the row number to which @child attaches its top side. *)
external get_row : t -> int = "ml_gtk_grid_layout_child_get_row"

(** Retrieves the number of columns that @child spans to. *)
external get_column_span : t -> int = "ml_gtk_grid_layout_child_get_column_span"

(** Retrieves the column number to which @child attaches its left side. *)
external get_column : t -> int = "ml_gtk_grid_layout_child_get_column"

