class type popover_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GNative.native_t
  inherit GShortcut_manager.shortcut_manager_t

  method on_activate_default :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_closed : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_autohide : unit -> bool
  method get_cascade_popdown : unit -> bool

  method get_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_has_arrow : unit -> bool
  method get_mnemonics_visible : unit -> bool
  method get_position : unit -> Gtk_enums.positiontype
  method popdown : unit -> unit
  method popup : unit -> unit
  method present : unit -> unit
  method set_autohide : bool -> unit
  method set_cascade_popdown : bool -> unit

  method set_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_default_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_has_arrow : bool -> unit
  method set_mnemonics_visible : bool -> unit
  method set_offset : int -> int -> unit
  method set_pointing_to : Ocgtk_gdk.Gdk.Rectangle.rectangle_t option -> unit
  method set_position : Gtk_enums.positiontype -> unit
  method as_popover : Popover.t
end

class popover : Popover.t -> popover_t

val new_ : unit -> popover_t
