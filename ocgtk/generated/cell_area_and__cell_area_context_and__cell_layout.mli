(** The classes of {!Ocgtk.Cell_area}, {!Ocgtk.Cell_area_context},
    {!Ocgtk.Cell_layout}, defined together because they refer to each other.
    Each has a module of its own that re-exports it; use that module rather than
    this one. *)

(** The methods, signals and properties of a [GtkCellArea]. *)
class type cell_area_t = object
  inherit Buildable.buildable_t

  method on_focus_changed :
    ?after:bool ->
    callback:(renderer:Cell_renderer.cell_renderer_t -> path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_remove_editable :
    ?after:bool ->
    callback:
      (renderer:Cell_renderer.cell_renderer_t ->
      editable:Cell_editable.cell_editable_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method activate :
    cell_area_context_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool ->
    bool

  method activate_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Cell_renderer.cell_renderer_t ->
    Ocgdk.Event.event_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool

  method add : Cell_renderer.cell_renderer_t -> unit

  method add_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit

  method apply_attributes :
    Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit

  method attribute_connect :
    Cell_renderer.cell_renderer_t -> string -> int -> unit

  method attribute_disconnect : Cell_renderer.cell_renderer_t -> string -> unit
  method attribute_get_column : Cell_renderer.cell_renderer_t -> string -> int

  method cell_get_property :
    Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit

  method cell_set_property :
    Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit

  method copy_context : cell_area_context_t -> cell_area_context_t
  method create_context : unit -> cell_area_context_t

  method event :
    cell_area_context_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgdk.Event.event_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    int

  method focus : Enums.directiontype -> bool
  method get_current_path_string : unit -> string
  method get_edit_widget : unit -> Cell_editable.cell_editable_t option
  method get_edited_cell : unit -> Cell_renderer.cell_renderer_t option
  method get_focus_cell : unit -> Cell_renderer.cell_renderer_t option

  method get_focus_from_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t option

  method get_focus_siblings :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t list

  method get_request_mode : unit -> Enums.sizerequestmode
  method has_renderer : Cell_renderer.cell_renderer_t -> bool
  method is_activatable : unit -> bool

  method is_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> bool

  method remove : Cell_renderer.cell_renderer_t -> unit

  method remove_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit

  method set_focus_cell : Cell_renderer.cell_renderer_t option -> unit

  method snapshot :
    cell_area_context_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Snapshot.snapshot_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool ->
    unit

  method stop_editing : bool -> unit
  method as_cell_area : Raw.Cell_area.t
end

(** The methods, signals and properties of a [GtkCellAreaContext]. *)
and cell_area_context_t = object
  method allocate : int -> int -> unit
  method get_area : unit -> cell_area_t
  method push_preferred_height : int -> int -> unit
  method push_preferred_width : int -> int -> unit
  method reset : unit -> unit
  method minimum_height : int
  method minimum_width : int
  method natural_height : int
  method natural_width : int
  method as_cell_area_context : Raw.Cell_area_context.t
end

(** The methods, signals and properties of a [GtkCellLayout]. *)
and cell_layout_t = object
  method add_attribute : Cell_renderer.cell_renderer_t -> string -> int -> unit
  method clear : unit -> unit
  method clear_attributes : Cell_renderer.cell_renderer_t -> unit
  method get_area : unit -> cell_area_t option
  method get_cells : unit -> Cell_renderer.cell_renderer_t list
  method pack_end : Cell_renderer.cell_renderer_t -> bool -> unit
  method pack_start : Cell_renderer.cell_renderer_t -> bool -> unit
  method reorder : Cell_renderer.cell_renderer_t -> int -> unit
  method as_cell_layout : Raw.Cell_layout.t
end

(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_area.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCellArea], give one already wrapped. *)
class cell_area : Raw.Cell_area.t -> cell_area_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_area_context.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkCellAreaContext], give one already wrapped. *)

and cell_area_context : Raw.Cell_area_context.t -> cell_area_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_layout.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCellLayout], give one already wrapped. *)

and cell_layout : Raw.Cell_layout.t -> cell_layout_t
