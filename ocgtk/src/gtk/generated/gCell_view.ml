class type cell_view_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_displayed_row : unit -> Tree_path.t option
    method get_draw_sensitive : unit -> bool
    method get_fit_model : unit -> bool
    method get_model : unit -> GTree_model.tree_model_t option
    method set_displayed_row : Tree_path.t option -> unit
    method set_draw_sensitive : bool -> unit
    method set_fit_model : bool -> unit
    method cell_area : GCell_area_and__cell_area_context.cell_area_t
    method cell_area_context : GCell_area_and__cell_area_context.cell_area_context_t
    method as_cell_view : Cell_view.t
end

(* High-level class for CellView *)
class cell_view (obj : Cell_view.t) : cell_view_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_displayed_row : unit -> Tree_path.t option =
    fun () ->
      (Cell_view.get_displayed_row obj)

  method get_draw_sensitive : unit -> bool =
    fun () ->
      (Cell_view.get_draw_sensitive obj)

  method get_fit_model : unit -> bool =
    fun () ->
      (Cell_view.get_fit_model obj)

  method get_model : unit -> GTree_model.tree_model_t option =
    fun () ->
      Option.map (fun ret -> new GTree_model.tree_model ret) (Cell_view.get_model obj)

  method set_displayed_row : Tree_path.t option -> unit =
    fun path ->
      (Cell_view.set_displayed_row obj path)

  method set_draw_sensitive : bool -> unit =
    fun draw_sensitive ->
      (Cell_view.set_draw_sensitive obj draw_sensitive)

  method set_fit_model : bool -> unit =
    fun fit_model ->
      (Cell_view.set_fit_model obj fit_model)

  method cell_area = new GCell_area_and__cell_area_context.cell_area (Cell_view.get_cell_area obj)

  method cell_area_context = new GCell_area_and__cell_area_context.cell_area_context (Cell_view.get_cell_area_context obj)

    method as_cell_view = obj
end

let new_ () : cell_view_t =
  new cell_view (Cell_view.new_ ())

let new_with_context (area : GCell_area_and__cell_area_context.cell_area_t) (context : GCell_area_and__cell_area_context.cell_area_context_t) : cell_view_t =
  let area = area#as_cell_area in
  let context = context#as_cell_area_context in
  new cell_view (Cell_view.new_with_context area context)

let new_with_markup (markup : string) : cell_view_t =
  new cell_view (Cell_view.new_with_markup markup)

let new_with_text (text : string) : cell_view_t =
  new cell_view (Cell_view.new_with_text text)

let new_with_texture (texture : Ocgtk_gdk.Gdk.Texture.texture_t) : cell_view_t =
  let texture = texture#as_texture in
  new cell_view (Cell_view.new_with_texture texture)

