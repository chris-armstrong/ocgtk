(** A widget displaying a single row of a GtkTreeModel

    A [GtkCellView] displays a single row of a [GtkTreeModel] using a
    [GtkCellArea] and [GtkCellAreaContext]. A [GtkCellAreaContext] can be
    provided to the [GtkCellView] at construction time in order to keep the
    cellview in context of a group of cell views, this ensures that the
    renderers displayed will be properly aligned with each other (like the
    aligned cells in the menus of [GtkComboBox]).

    [GtkCellView] is [GtkOrientable] in order to decide in which orientation the
    underlying [GtkCellAreaContext] should be allocated. Taking the
    [GtkComboBox] menu as an example, cellviews should be oriented horizontally
    if the menus are listed top-to-bottom and thus all share the same width but
    may have separate individual heights (left-to-right menus should be
    allocated vertically since they all share the same height but may have
    variable widths).

    {b CSS nodes}

    GtkCellView has a single CSS node with name cellview.

    Its methods, signals and properties are on {!class-type-cell_view_t}. The
    functions it is built on are in {!Ocgtk.Raw.Cell_view}. *)

(** The methods, signals and properties of a [GtkCellView]. *)
class type cell_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t
  inherit Orientable.orientable_t

  method get_displayed_row : unit -> Raw.Tree_path.t option
  (** Returns a [GtkTreePath] referring to the currently displayed row. If no
      row is currently displayed, [NULL] is returned. *)

  method get_draw_sensitive : unit -> bool
  (** Gets whether [cell_view] is configured to draw all of its cells in a
      sensitive state. *)

  method get_fit_model : unit -> bool
  (** Gets whether [cell_view] is configured to request space to fit the entire
      [GtkTreeModel]. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the model for [cell_view]. If no model is used [NULL] is returned.
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
      will remove it before setting the new model. If [model] is [NULL], then it
      will unset the old model. *)

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method cell_area_context :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_context_t

  method as_cell_view : Raw.Cell_view.t
end

class cell_view : Raw.Cell_view.t -> cell_view_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_view.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCellView], give one already wrapped. *)

val new_ : unit -> cell_view_t

val new_with_context :
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t ->
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_context_t ->
  cell_view_t

val new_with_markup : string -> cell_view_t
val new_with_text : string -> cell_view_t
val new_with_texture : Ocgdk.Texture.texture_t -> cell_view_t
