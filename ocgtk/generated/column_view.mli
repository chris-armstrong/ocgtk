(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ColumnView from cyclic group Column_view_and__column_view_column *)

class type column_view_t = GColumn_view_and__column_view_column.column_view_t

class column_view :
  Column_view_and__column_view_column.Column_view.t ->
  column_view_t

val new_ : GSelection_model.selection_model_t option -> column_view_t
