class type popover_menu_t = object
    method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> bool
    method get_flags : unit -> Gtk_enums.popovermenuflags
    method get_menu_model : unit -> Ocgtk_gio.Gio.menu_model_t option
    method remove_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method set_flags : Gtk_enums.popovermenuflags -> unit
    method set_menu_model : Ocgtk_gio.Gio.menu_model_t option -> unit
    method visible_submenu : string
    method set_visible_submenu : string -> unit
    method as_popover_menu : Popover_menu.t
end

class popover_menu : Popover_menu.t -> popover_menu_t

