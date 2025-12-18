class menu_button : Menu_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gmenu_button_signals.menu_button_signals
    method active : bool
    method set_active : bool -> unit
    method always_show_arrow : bool
    method set_always_show_arrow : bool -> unit
    method can_shrink : bool
    method set_can_shrink : bool -> unit
    method has_frame : bool
    method set_has_frame : bool -> unit
    method icon_name : string
    method set_icon_name : string -> unit
    method label : string
    method set_label : string -> unit
    method primary : bool
    method set_primary : bool -> unit
    method use_underline : bool
    method set_use_underline : bool -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    (* method get_direction : ... *) (* CONFLICT: incompatible signature with parent method *)
    method get_popover : unit -> GPopover.popover option
    method popdown : unit -> unit
    method popup : unit -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    (* method set_direction : ... *) (* CONFLICT: incompatible signature with parent method *)
    method set_popover : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_menu_button : Menu_button.t
  end

