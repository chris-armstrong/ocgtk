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

(* High-level class for CellView *)
class cell_view (obj : Raw.Cell_view.t) : cell_view_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Cell_area_and__cell_area_context_and__cell_layout.cell_layout
        (Raw.Cell_layout.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_displayed_row : unit -> Raw.Tree_path.t option =
      fun () -> Raw.Cell_view.get_displayed_row obj

    method get_draw_sensitive : unit -> bool =
      fun () -> Raw.Cell_view.get_draw_sensitive obj

    method get_fit_model : unit -> bool =
      fun () -> Raw.Cell_view.get_fit_model obj

    method get_model : unit -> Tree_model.tree_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_model.tree_model ret)
          (Raw.Cell_view.get_model obj)

    method set_displayed_row : Raw.Tree_path.t option -> unit =
      fun path -> Raw.Cell_view.set_displayed_row obj path

    method set_draw_sensitive : bool -> unit =
      fun draw_sensitive -> Raw.Cell_view.set_draw_sensitive obj draw_sensitive

    method set_fit_model : bool -> unit =
      fun fit_model -> Raw.Cell_view.set_fit_model obj fit_model

    method set_model : Tree_model.tree_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_tree_model) model in
        Raw.Cell_view.set_model obj model

    method cell_area =
      new Cell_area_and__cell_area_context_and__cell_layout.cell_area
        (Raw.Cell_view.get_cell_area obj)

    method cell_area_context =
      new Cell_area_and__cell_area_context_and__cell_layout.cell_area_context
        (Raw.Cell_view.get_cell_area_context obj)

    method as_cell_view = obj
  end

let new_ () : cell_view_t = new cell_view (Raw.Cell_view.new_ ())

let new_with_context
    (area : Cell_area_and__cell_area_context_and__cell_layout.cell_area_t)
    (context :
      Cell_area_and__cell_area_context_and__cell_layout.cell_area_context_t) :
    cell_view_t =
  let area = area#as_cell_area in
  let context = context#as_cell_area_context in
  let obj_ = Raw.Cell_view.new_with_context area context in
  new cell_view obj_

let new_with_markup (markup : string) : cell_view_t =
  let obj_ = Raw.Cell_view.new_with_markup markup in
  new cell_view obj_

let new_with_text (text : string) : cell_view_t =
  let obj_ = Raw.Cell_view.new_with_text text in
  new cell_view obj_

let new_with_texture (texture : Ocgdk.Texture.texture_t) : cell_view_t =
  let texture = texture#as_texture in
  let obj_ = Raw.Cell_view.new_with_texture texture in
  new cell_view obj_
