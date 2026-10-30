class type cell_view_t = object
  inherit Widget.widget_t
  inherit Cell_layout.cell_layout_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_displayed_row : unit -> Raw.Tree_path.t option
  (** Returns a [GtkTreePath] referring to the currently displayed row. If no
      row is currently displayed, [None] is returned. *)

  method get_draw_sensitive : unit -> bool
  (** Gets whether [cell_view] is configured to draw all of its cells in a
      sensitive state. *)

  method get_fit_model : unit -> bool
  (** Gets whether [cell_view] is configured to request space to fit the entire
      [GtkTreeModel]. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the model for [cell_view]. If no model is used [None] is returned.
  *)

  method set_displayed_row : Raw.Tree_path.t option -> unit
  (** Sets the row of the model that is currently displayed by the
      [GtkCellView]. If the path is unset, then the contents of the cellview
      “stick” at their last value; this is not normally a desired result, but
      may be a needed intermediate state if say, the model for the [GtkCellView]
      becomes temporarily empty. *)

  method set_draw_sensitive : bool -> unit
  (** Sets whether [cell_view] should draw all of its cells in a sensitive
      state, this is used by [GtkComboBox] menus to ensure that rows with
      insensitive cells that contain children appear sensitive in the parent
      menu item. *)

  method set_fit_model : bool -> unit
  (** Sets whether [cell_view] should request space to fit the entire
      [GtkTreeModel].

      This is used by [GtkComboBox] to ensure that the cell view displayed on
      the combo box’s button always gets enough space and does not resize when
      selection changes. *)

  method set_model : Tree_model.tree_model_t option -> unit
  (** Sets the model for [cell_view]. If [cell_view] already has a model set, it
      will remove it before setting the new model. If [model] is [None], then it
      will unset the old model. *)

  (** {2:properties Properties} *)

  method cell_area : Cell_area.cell_area_t
  (** The [GtkCellArea] rendering cells

      If no area is specified when creating the cell view with
      [gtk_cell_view_new_with_context ()] a horizontally oriented
      [GtkCellArea]Box will be used.

      since 3.0 *)

  method cell_area_context : Cell_area_context.cell_area_context_t
  (** The [GtkCellAreaContext] used to compute the geometry of the cell view.

      A group of cell views can be assigned the same context in order to ensure
      the sizes and cell alignments match across all the views with the same
      context.

      [GtkComboBox] menus uses this to assign the same context to all cell views
      in the menu items for a single menu (each submenu creates its own context
      since the size of each submenu does not depend on parent or sibling
      menus).

      since 3.0 *)

  (** {2:conversions Conversions} *)

  method as_cell_view : Raw.Cell_view.t
end

(* High-level class for CellView *)
class cell_view (obj : Raw.Cell_view.t) : cell_view_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Cell_layout.cell_layout (Raw.Cell_layout.from_gobject obj)
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

    method cell_area = new Cell_area.cell_area (Raw.Cell_view.get_cell_area obj)

    method cell_area_context =
      new Cell_area_context.cell_area_context
        (Raw.Cell_view.get_cell_area_context obj)

    method as_cell_view = obj
  end

let new_ () : cell_view_t = new cell_view (Raw.Cell_view.new_ ())

let new_with_context (area : Cell_area.cell_area_t)
    (context : Cell_area_context.cell_area_context_t) : cell_view_t =
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
