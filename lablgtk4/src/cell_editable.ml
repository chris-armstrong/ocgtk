(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellEditable *)

type t = Gtk.Widget.t

(* Properties *)

external get_editing_canceled : t -> bool = "ml_gtk_cell_editable_get_editing_canceled"

external set_editing_canceled : t -> bool -> unit = "ml_gtk_cell_editable_set_editing_canceled"

external start_editing : t -> _ Gdk.event option -> unit = "ml_gtk_cell_editable_start_editing"

external remove_widget : t -> unit = "ml_gtk_cell_editable_remove_widget"

external editing_done : t -> unit = "ml_gtk_cell_editable_editing_done"

