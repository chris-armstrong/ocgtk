(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for CellAreaContext from cyclic group Cell_area_and__cell_area_context_and__cell_layout *)

(** Stores geometrical information for a series of rows in a GtkCellArea

    The [GtkCellAreaContext] object is created by a given [GtkCellArea]
    implementation via its [GtkCellAreaClass.create_context()] virtual method
    and is used to store cell sizes and alignments for a series of
    [GtkTreeModel] rows that are requested and rendered in the same context.

    [GtkCellLayout] widgets can create any number of contexts in which to
    request and render groups of data rows. However, it’s important that the
    same context which was used to request sizes for a given [GtkTreeModel] row
    also be used for the same row when calling other [GtkCellArea] APIs such as
    gtk_cell_area_render() and gtk_cell_area_event().

    Its methods, signals and properties are on
    {!class-type-cell_area_context_t}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_area_context}. *)

class type cell_area_context_t =
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_context_t
(** The methods, signals and properties of a [CellAreaContext]. *)

class cell_area_context : Raw.Cell_area_context.t -> cell_area_context_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_area_context.t}. *)
