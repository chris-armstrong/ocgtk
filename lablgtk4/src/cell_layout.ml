(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellLayout *)

type t = Gtk.widget

external reorder : t -> Gtk.widget -> int -> unit = "ml_gtk_cell_layout_reorder"

external pack_start : t -> Gtk.widget -> bool -> unit = "ml_gtk_cell_layout_pack_start"

external pack_end : t -> Gtk.widget -> bool -> unit = "ml_gtk_cell_layout_pack_end"

external get_area : t -> Gtk.widget = "ml_gtk_cell_layout_get_area"

external clear_attributes : t -> Gtk.widget -> unit = "ml_gtk_cell_layout_clear_attributes"

external clear : t -> unit = "ml_gtk_cell_layout_clear"

external add_attribute : t -> Gtk.widget -> string -> int -> unit = "ml_gtk_cell_layout_add_attribute"

