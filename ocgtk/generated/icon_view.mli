(** [GtkIconView] is a widget which displays data in a grid of icons.

    An example GtkIconView

    [GtkIconView] provides an alternative view on a [GtkTreeModel]. It displays
    the model as a grid of icons with labels. Like [Gtk.TreeView], it allows to
    select one or multiple items (depending on the selection mode, see
    [Gtk.IconView.set_selection_mode]). In addition to selection with the arrow
    keys, [GtkIconView] supports rubberband selection, which is controlled by
    dragging the pointer.

    Note that if the tree model is backed by an actual tree store (as opposed to
    a flat list where the mapping to icons is obvious), [GtkIconView] will only
    display the first level of the tree and ignore the tree’s branches.

    {b CSS nodes}

    {[
    iconview.view
    ╰── [rubberband]
    ]}

    [GtkIconView] has a single CSS node with name iconview and style class
    .view. For rubberband selection, a subnode with name rubberband is used.

    Its methods, signals and properties are on {!class-type-icon_view_t}. The
    functions it is built on are in {!Ocgtk.Raw.Icon_view}. *)

(** The methods, signals and properties of a [GtkIconView]. *)
class type icon_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t
  inherit Scrollable.scrollable_t

  method on_activate_cursor_item :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_select_cursor_item :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_selection_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_item :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method create_drag_icon :
    Raw.Tree_path.t -> Ocgdk.Paintable.paintable_t option

  method enable_model_drag_dest :
    Ocgdk.Content_formats.content_formats_t -> Ocgdk.Enums.dragaction -> unit

  method enable_model_drag_source :
    Ocgdk.Enums.modifiertype ->
    Ocgdk.Content_formats.content_formats_t ->
    Ocgdk.Enums.dragaction ->
    unit

  method get_activate_on_single_click : unit -> bool
  method get_column_spacing : unit -> int
  method get_columns : unit -> int
  method get_item_column : Raw.Tree_path.t -> int
  method get_item_orientation : unit -> Enums.orientation
  method get_item_padding : unit -> int
  method get_item_row : Raw.Tree_path.t -> int
  method get_item_width : unit -> int
  method get_margin : unit -> int
  method get_markup_column : unit -> int
  method get_model : unit -> Tree_model.tree_model_t option
  method get_path_at_pos : int -> int -> Raw.Tree_path.t option
  method get_pixbuf_column : unit -> int
  method get_reorderable : unit -> bool
  method get_row_spacing : unit -> int
  method get_selected_items : unit -> Raw.Tree_path.t list
  method get_selection_mode : unit -> Enums.selectionmode
  method get_spacing : unit -> int
  method get_text_column : unit -> int
  method get_tooltip_column : unit -> int
  method item_activated : Raw.Tree_path.t -> unit
  method path_is_selected : Raw.Tree_path.t -> bool
  method scroll_to_path : Raw.Tree_path.t -> bool -> float -> float -> unit
  method select_all : unit -> unit
  method select_path : Raw.Tree_path.t -> unit
  method set_activate_on_single_click : bool -> unit
  method set_column_spacing : int -> unit
  method set_columns : int -> unit

  method set_drag_dest_item :
    Raw.Tree_path.t option -> Enums.iconviewdropposition -> unit

  method set_item_orientation : Enums.orientation -> unit
  method set_item_padding : int -> unit
  method set_item_width : int -> unit
  method set_margin : int -> unit
  method set_markup_column : int -> unit
  method set_model : Tree_model.tree_model_t option -> unit
  method set_pixbuf_column : int -> unit
  method set_reorderable : bool -> unit
  method set_row_spacing : int -> unit
  method set_selection_mode : Enums.selectionmode -> unit
  method set_spacing : int -> unit
  method set_text_column : int -> unit

  method set_tooltip_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    Cell_renderer.cell_renderer_t option ->
    unit

  method set_tooltip_column : int -> unit

  method set_tooltip_item :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    unit

  method unselect_all : unit -> unit
  method unselect_path : Raw.Tree_path.t -> unit
  method unset_model_drag_dest : unit -> unit
  method unset_model_drag_source : unit -> unit

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_icon_view : Raw.Icon_view.t
end

class icon_view : Raw.Icon_view.t -> icon_view_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Icon_view.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkIconView], give one already wrapped. *)

val new_ : unit -> icon_view_t

val new_with_area :
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t -> icon_view_t

val new_with_model : Tree_model.tree_model_t -> icon_view_t
