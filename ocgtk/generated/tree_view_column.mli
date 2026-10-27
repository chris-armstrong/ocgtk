(** A visible column in a [Gtk.TreeView] widget

    The [GtkTreeViewColumn] object represents a visible column in a
    [GtkTreeView] widget. It allows to set properties of the column header, and
    functions as a holding pen for the cell renderers which determine how the
    data in the column is displayed.

    Please refer to the tree widget conceptual overview for an overview of all
    the objects and data types related to the tree widget and how they work
    together, and to the [Gtk.TreeView] documentation for specifics about the
    CSS node structure for treeviews and their headers.

    Its methods, signals and properties are on {!class-type-tree_view_column_t}.
    The functions it is built on are in {!Ocgtk.Raw.Tree_view_column}. *)

(** The methods, signals and properties of a [GtkTreeViewColumn]. *)
class type tree_view_column_t = object
  inherit Buildable.buildable_t
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method cell_is_visible : unit -> bool

  method cell_set_cell_data :
    Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit

  method clicked : unit -> unit
  method focus_cell : Cell_renderer.cell_renderer_t -> unit
  method get_alignment : unit -> float

  method get_button :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_clickable : unit -> bool
  method get_expand : unit -> bool
  method get_fixed_width : unit -> int
  method get_max_width : unit -> int
  method get_min_width : unit -> int
  method get_reorderable : unit -> bool
  method get_resizable : unit -> bool
  method get_sizing : unit -> Enums.treeviewcolumnsizing
  method get_sort_column_id : unit -> int
  method get_sort_indicator : unit -> bool
  method get_sort_order : unit -> Enums.sorttype
  method get_spacing : unit -> int
  method get_title : unit -> string

  method get_tree_view :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_visible : unit -> bool

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_width : unit -> int
  method get_x_offset : unit -> int
  method queue_resize : unit -> unit
  method set_alignment : float -> unit
  method set_clickable : bool -> unit
  method set_expand : bool -> unit
  method set_fixed_width : int -> unit
  method set_max_width : int -> unit
  method set_min_width : int -> unit
  method set_reorderable : bool -> unit
  method set_resizable : bool -> unit
  method set_sizing : Enums.treeviewcolumnsizing -> unit
  method set_sort_column_id : int -> unit
  method set_sort_indicator : bool -> unit
  method set_sort_order : Enums.sorttype -> unit
  method set_spacing : int -> unit
  method set_title : string -> unit
  method set_visible : bool -> unit

  method set_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_tree_view_column : Raw.Tree_view_column.t
end

class tree_view_column : Raw.Tree_view_column.t -> tree_view_column_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_view_column.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTreeViewColumn], give one already wrapped. *)

val new_ : unit -> tree_view_column_t

val new_with_area :
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t ->
  tree_view_column_t
