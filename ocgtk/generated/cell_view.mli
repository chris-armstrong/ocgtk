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
