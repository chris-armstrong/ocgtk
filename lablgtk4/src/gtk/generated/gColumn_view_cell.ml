(* High-level class for ColumnViewCell *)
class column_view_cell (obj : Column_view_cell.t) = object (self)

  method focusable = Column_view_cell.get_focusable obj
  method set_focusable v = Column_view_cell.set_focusable obj v

  method position = Column_view_cell.get_position obj

  method selected = Column_view_cell.get_selected obj

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Column_view_cell.get_child obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Column_view_cell.set_child obj child)

    method as_column_view_cell = obj
end

