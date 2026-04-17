class type list_box_row_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GActionable.actionable_t
  inherit Glist_box_row_signals.list_box_row_signals
  method changed : unit -> unit
  method get_activatable : unit -> bool

  method get_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_header :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_index : unit -> int
  method get_selectable : unit -> bool
  method is_selected : unit -> bool
  method set_activatable : bool -> unit

  method set_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_header :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_selectable : bool -> unit
  method as_list_box_row : List_box_row.t
end

class list_box_row : List_box_row.t -> list_box_row_t

val new_ : unit -> list_box_row_t
