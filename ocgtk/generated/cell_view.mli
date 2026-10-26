class type cell_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t
  inherit Orientable.orientable_t
  method get_displayed_row : unit -> Raw.Tree_path.t option
  method get_draw_sensitive : unit -> bool
  method get_fit_model : unit -> bool
  method get_model : unit -> Tree_model.tree_model_t option
  method set_displayed_row : Raw.Tree_path.t option -> unit
  method set_draw_sensitive : bool -> unit
  method set_fit_model : bool -> unit
  method set_model : Tree_model.tree_model_t option -> unit

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method cell_area_context :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_context_t

  method as_cell_view : Raw.Cell_view.t
end

class cell_view : Raw.Cell_view.t -> cell_view_t

val new_ : unit -> cell_view_t

val new_with_context :
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t ->
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_context_t ->
  cell_view_t

val new_with_markup : string -> cell_view_t
val new_with_text : string -> cell_view_t
val new_with_texture : Ocgdk.Texture.texture_t -> cell_view_t
