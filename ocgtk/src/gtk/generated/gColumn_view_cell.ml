class type column_view_cell_t = object
    inherit GList_item.list_item_t
    method as_column_view_cell : Column_view_cell.t
end

(* High-level class for ColumnViewCell *)
class column_view_cell (obj : Column_view_cell.t) : column_view_cell_t = object (self)
  inherit GList_item.list_item (Obj.magic obj : List_item.t)

    method as_column_view_cell = obj
end

