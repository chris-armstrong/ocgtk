class type shortcut_action_t = object
    method activate : Gtk_enums.shortcutactionflags -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Gvariant.t option -> bool
    method to_string : unit -> string
    method as_shortcut_action : Shortcut_action.t
end

class shortcut_action : Shortcut_action.t -> shortcut_action_t

val parse_string : string -> shortcut_action_t
