class type menu_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gmenu_button_signals.menu_button_signals
    method get_active : unit -> bool
    method get_always_show_arrow : unit -> bool
    method get_can_shrink : unit -> bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_has_frame : unit -> bool
    method get_icon_name : unit -> string option
    method get_label : unit -> string option
    method get_menu_model : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
    method get_popover : unit -> GPopover.popover_t option
    method get_primary : unit -> bool
    method get_use_underline : unit -> bool
    method popdown : unit -> unit
    method popup : unit -> unit
    method set_active : bool -> unit
    method set_always_show_arrow : bool -> unit
    method set_can_shrink : bool -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_has_frame : bool -> unit
    method set_icon_name : string -> unit
    method set_label : string -> unit
    method set_menu_model : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
    method set_popover : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_primary : bool -> unit
    method set_use_underline : bool -> unit
    method as_menu_button : Menu_button.t
end

class menu_button : Menu_button.t -> menu_button_t

val new_ : unit -> menu_button_t
