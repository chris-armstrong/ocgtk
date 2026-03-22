(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ColumnViewColumn from cyclic group Column_view_and__column_view_column *)

class type column_view_column_t = GColumn_view_and__column_view_column.column_view_column_t

class column_view_column = GColumn_view_and__column_view_column.column_view_column

let new_ (title : string option) (factory : GList_item_factory.list_item_factory_t option) : column_view_column_t =
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  new column_view_column
    (Column_view_and__column_view_column.Column_view_column.new_ title factory)
