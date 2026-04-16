class type column_view_cell_t = object
  inherit GList_item.list_item_t
  method as_column_view_cell : Column_view_cell.t
end

class column_view_cell : Column_view_cell.t -> column_view_cell_t
