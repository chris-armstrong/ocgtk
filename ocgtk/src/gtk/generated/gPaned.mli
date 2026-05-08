class type paned_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GAccessible_range.accessible_range_t
  inherit GOrientable.orientable_t

  method on_accept_position :
    callback:(unit -> bool) -> Gobject.Signal.handler_id

  method on_cancel_position :
    callback:(unit -> bool) -> Gobject.Signal.handler_id

  method on_cycle_child_focus :
    callback:(reversed:bool -> bool) -> Gobject.Signal.handler_id

  method on_cycle_handle_focus :
    callback:(reversed:bool -> bool) -> Gobject.Signal.handler_id

  method on_move_handle :
    callback:(scroll_type:Gtk_enums.scrolltype -> bool) ->
    Gobject.Signal.handler_id

  method on_toggle_handle_focus :
    callback:(unit -> bool) -> Gobject.Signal.handler_id

  method get_end_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_position : unit -> int
  method get_resize_end_child : unit -> bool
  method get_resize_start_child : unit -> bool
  method get_shrink_end_child : unit -> bool
  method get_shrink_start_child : unit -> bool

  method get_start_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_wide_handle : unit -> bool

  method set_end_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_position : int -> unit
  method set_resize_end_child : bool -> unit
  method set_resize_start_child : bool -> unit
  method set_shrink_end_child : bool -> unit
  method set_shrink_start_child : bool -> unit

  method set_start_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_wide_handle : bool -> unit
  method max_position : int
  method min_position : int
  method position_set : bool
  method set_position_set : bool -> unit
  method as_paned : Paned.t
end

class paned : Paned.t -> paned_t

val new_ : Gtk_enums.orientation -> paned_t
