(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellLayout *)

type t = Gtk.Widget.t

external set_cell_data_func : t -> Gtk.Widget.t -> unit -> unit -> unit -> unit = "ml_gtk_cell_layout_set_cell_data_func"

external set_attributes : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_cell_layout_set_attributes"

external reorder : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_cell_layout_reorder"

external pack_start : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_cell_layout_pack_start"

external pack_end : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_cell_layout_pack_end"

external get_cells : t -> unit = "ml_gtk_cell_layout_get_cells"

external get_area : t -> Gtk.Widget.t = "ml_gtk_cell_layout_get_area"

external clear_attributes : t -> Gtk.Widget.t -> unit = "ml_gtk_cell_layout_clear_attributes"

external clear : t -> unit = "ml_gtk_cell_layout_clear"

external add_attribute : t -> Gtk.Widget.t -> string -> int -> unit = "ml_gtk_cell_layout_add_attribute"

