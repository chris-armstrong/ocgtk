(* High-level class for ColumnViewRow *)
class column_view_row (obj : Column_view_row.t) = object (self)

  method accessible_description = Column_view_row.get_accessible_description obj
  method set_accessible_description v = Column_view_row.set_accessible_description obj v

  method accessible_label = Column_view_row.get_accessible_label obj
  method set_accessible_label v = Column_view_row.set_accessible_label obj v

  method activatable = Column_view_row.get_activatable obj
  method set_activatable v = Column_view_row.set_activatable obj v

  method focusable = Column_view_row.get_focusable obj
  method set_focusable v = Column_view_row.set_focusable obj v

  method position = Column_view_row.get_position obj

  method selectable = Column_view_row.get_selectable obj
  method set_selectable v = Column_view_row.set_selectable obj v

  method selected = Column_view_row.get_selected obj

    method as_column_view_row = obj
end

