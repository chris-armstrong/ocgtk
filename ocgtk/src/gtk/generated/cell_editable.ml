(* GENERATED CODE - DO NOT EDIT *)
(* CellEditable: CellEditable *)

type t = [`cell_editable] Gobject.obj

(* Methods *)
(** Emits the `GtkCellEditable::remove-widget` signal. *)
external remove_widget : t -> unit = "ml_gtk_cell_editable_remove_widget"

(** Emits the `GtkCellEditable::editing-done` signal. *)
external editing_done : t -> unit = "ml_gtk_cell_editable_editing_done"

(* Properties *)

(** Get property: editing-canceled *)
external get_editing_canceled : t -> bool = "ml_gtk_cell_editable_get_editing_canceled"

(** Set property: editing-canceled *)
external set_editing_canceled : t -> bool -> unit = "ml_gtk_cell_editable_set_editing_canceled"

