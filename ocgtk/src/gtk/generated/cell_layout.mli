(* GENERATED CODE - DO NOT EDIT *)
(* CellLayout: CellLayout *)

type t = [ `cell_layout ] Gobject.obj

(* Methods *)

external reorder : t -> Cell_renderer.t -> int -> unit
  = "ml_gtk_cell_layout_reorder"
(** Re-inserts @cell at @position.

Note that @cell has already to be packed into @cell_layout
for this to function properly. *)

external pack_start : t -> Cell_renderer.t -> bool -> unit
  = "ml_gtk_cell_layout_pack_start"
(** Packs the @cell into the beginning of @cell_layout. If @expand is %FALSE,
then the @cell is allocated no more space than it needs. Any unused space
is divided evenly between cells for which @expand is %TRUE.

Note that reusing the same cell renderer is not supported. *)

external pack_end : t -> Cell_renderer.t -> bool -> unit
  = "ml_gtk_cell_layout_pack_end"
(** Adds the @cell to the end of @cell_layout. If @expand is %FALSE, then the
@cell is allocated no more space than it needs. Any unused space is
divided evenly between cells for which @expand is %TRUE.

Note that reusing the same cell renderer is not supported. *)

external get_cells : t -> Cell_renderer.t list = "ml_gtk_cell_layout_get_cells"
(** Returns the cell renderers which have been added to @cell_layout. *)

external get_area : t -> Cell_area_and__cell_area_context.Cell_area.t option
  = "ml_gtk_cell_layout_get_area"
(** Returns the underlying `GtkCellArea` which might be @cell_layout
if called on a `GtkCellArea` or might be %NULL if no `GtkCellArea`
is used by @cell_layout. *)

external clear_attributes : t -> Cell_renderer.t -> unit
  = "ml_gtk_cell_layout_clear_attributes"
(** Clears all existing attributes previously set with
    gtk_cell_layout_set_attributes(). *)

external clear : t -> unit = "ml_gtk_cell_layout_clear"
(** Unsets all the mappings on all renderers on @cell_layout and
removes all renderers from @cell_layout. *)

external add_attribute : t -> Cell_renderer.t -> string -> int -> unit
  = "ml_gtk_cell_layout_add_attribute"
(** Adds an attribute mapping to the list in @cell_layout.

The @column is the column of the model to get a value from, and the
@attribute is the property on @cell to be set from that value. So for
example if column 2 of the model contains strings, you could have the
“text” attribute of a `GtkCellRendererText` get its values from column 2.
In this context "attribute" and "property" are used interchangeably. *)
