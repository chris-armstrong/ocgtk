(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellEditable *)

type t = Gtk.widget

(* Properties *)

(** Begins editing on a @cell_editable.

The `GtkCellRenderer` for the cell creates and returns a `GtkCellEditable` from
gtk_cell_renderer_start_editing(), configured for the `GtkCellRenderer` type.

gtk_cell_editable_start_editing() can then set up @cell_editable suitably for
editing a cell, e.g. making the Esc key emit `GtkCellEditable::editing-done`.

Note that the @cell_editable is created on-demand for the current edit; its
lifetime is temporary and does not persist across other edits and/or cells. *)
external start_editing : t -> _ Gdk.event option -> unit = "ml_gtk_cell_editable_start_editing"

(** Emits the `GtkCellEditable::remove-widget` signal. *)
external remove_widget : t -> unit = "ml_gtk_cell_editable_remove_widget"

(** Emits the `GtkCellEditable::editing-done` signal. *)
external editing_done : t -> unit = "ml_gtk_cell_editable_editing_done"

