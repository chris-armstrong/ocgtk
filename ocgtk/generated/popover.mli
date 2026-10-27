class type popover_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t
  inherit Shortcut_manager.shortcut_manager_t

  method on_activate_default :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_closed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_autohide : unit -> bool
  method get_cascade_popdown : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_has_arrow : unit -> bool
  method get_mnemonics_visible : unit -> bool
  method get_position : unit -> Enums.positiontype
  method popdown : unit -> unit
  method popup : unit -> unit
  method present : unit -> unit
  method set_autohide : bool -> unit
  method set_cascade_popdown : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_default_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_has_arrow : bool -> unit
  method set_mnemonics_visible : bool -> unit
  method set_offset : int -> int -> unit
  method set_pointing_to : Ocgdk.Rectangle.rectangle_t option -> unit
  method set_position : Enums.positiontype -> unit
  method as_popover : Raw.Popover.t
end

class popover : Raw.Popover.t -> popover_t

val new_ : unit -> popover_t
