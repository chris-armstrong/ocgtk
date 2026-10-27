(* GENERATED CODE - DO NOT EDIT *)
(* CellAreaContext, a member of the cyclic module Cell_area_and__cell_area_context_and__cell_layout *)

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

    The class built on this module is in {!Ocgtk.Cell_area_context}. *)

include module type of struct
  include Cell_area_and__cell_area_context_and__cell_layout.Cell_area_context
end
