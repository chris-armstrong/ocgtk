class type stack_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t

  method add_named :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    Stack_page.stack_page_t

  method add_titled :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option ->
    string ->
    Stack_page.stack_page_t

  method get_child_by_name :
    string ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_hhomogeneous : unit -> bool
  method get_interpolate_size : unit -> bool

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Stack_page.stack_page_t

  method get_pages : unit -> Selection_model.selection_model_t
  method get_transition_duration : unit -> int
  method get_transition_running : unit -> bool
  method get_transition_type : unit -> Enums.stacktransitiontype
  method get_vhomogeneous : unit -> bool

  method get_visible_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_visible_child_name : unit -> string option

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_hhomogeneous : bool -> unit
  method set_interpolate_size : bool -> unit
  method set_transition_duration : int -> unit
  method set_transition_type : Enums.stacktransitiontype -> unit
  method set_vhomogeneous : bool -> unit

  method set_visible_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_visible_child_full : string -> Enums.stacktransitiontype -> unit
  method set_visible_child_name : string -> unit
  method as_stack : Raw.Stack.t
end

class stack : Raw.Stack.t -> stack_t

val new_ : unit -> stack_t
