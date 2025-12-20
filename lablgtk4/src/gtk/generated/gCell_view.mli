class cell_view : Cell_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_displayed_row : unit -> Tree_path.t option
    method get_draw_sensitive : unit -> bool
    method get_fit_model : unit -> bool
    method set_displayed_row : Tree_path.t option -> unit
    method set_draw_sensitive : bool -> unit
    method set_fit_model : bool -> unit
    method cell_area : GCell_area_and__cell_area_context.cell_area
    method cell_area_context : GCell_area_and__cell_area_context.cell_area_context
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_cell_view : Cell_view.t
  end

