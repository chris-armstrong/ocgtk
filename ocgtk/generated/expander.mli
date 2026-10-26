class type expander_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_expanded : unit -> bool
  method get_label : unit -> string option

  method get_label_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_resize_toplevel : unit -> bool
  method get_use_markup : unit -> bool
  method get_use_underline : unit -> bool

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_expanded : bool -> unit
  method set_label : string option -> unit

  method set_label_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_resize_toplevel : bool -> unit
  method set_use_markup : bool -> unit
  method set_use_underline : bool -> unit
  method as_expander : Raw.Expander.t
end

class expander : Raw.Expander.t -> expander_t

val new_ : string option -> expander_t
val new_with_mnemonic : string option -> expander_t
