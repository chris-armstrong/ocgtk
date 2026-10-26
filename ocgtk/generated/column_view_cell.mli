class type column_view_cell_t = object
  inherit List_item.list_item_t
  method as_column_view_cell : Raw.Column_view_cell.t
end

class column_view_cell : Raw.Column_view_cell.t -> column_view_cell_t
