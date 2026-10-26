class type list_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_row_activated :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_row_selected :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_selected_rows_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method drag_highlight_row : List_box_row.list_box_row_t -> unit
  method drag_unhighlight_row : unit -> unit
  method get_activate_on_single_click : unit -> bool
  method get_adjustment : unit -> Adjustment.adjustment_t option
  method get_row_at_index : int -> List_box_row.list_box_row_t option
  method get_row_at_y : int -> List_box_row.list_box_row_t option
  method get_selected_row : unit -> List_box_row.list_box_row_t option
  method get_selected_rows : unit -> List_box_row.list_box_row_t list
  method get_selection_mode : unit -> Enums.selectionmode
  method get_show_separators : unit -> bool
  method get_tab_behavior : unit -> Enums.listtabbehavior

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method invalidate_filter : unit -> unit
  method invalidate_headers : unit -> unit
  method invalidate_sort : unit -> unit

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_all : unit -> unit
  method select_all : unit -> unit
  method select_row : List_box_row.list_box_row_t option -> unit
  method set_activate_on_single_click : bool -> unit
  method set_adjustment : Adjustment.adjustment_t option -> unit

  method set_placeholder :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_selection_mode : Enums.selectionmode -> unit
  method set_show_separators : bool -> unit
  method set_tab_behavior : Enums.listtabbehavior -> unit
  method unselect_all : unit -> unit
  method unselect_row : List_box_row.list_box_row_t -> unit
  method accept_unpaired_release : bool
  method set_accept_unpaired_release : bool -> unit
  method as_list_box : Raw.List_box.t
end

class list_box : Raw.List_box.t -> list_box_t

val new_ : unit -> list_box_t
