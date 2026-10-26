class type column_view_cell_t = object
  inherit List_item.list_item_t
  method as_column_view_cell : Raw.Column_view_cell.t
end

(* High-level class for ColumnViewCell *)
class column_view_cell (obj : Raw.Column_view_cell.t) : column_view_cell_t =
  object (self)
    inherit List_item.list_item (obj :> Raw.List_item.t)
    method as_column_view_cell = obj
  end
