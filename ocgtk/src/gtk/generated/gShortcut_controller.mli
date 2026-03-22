class type shortcut_controller_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    method add_shortcut : GShortcut.shortcut_t -> unit
    method get_mnemonics_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype
    method get_scope : unit -> Gtk_enums.shortcutscope
    method remove_shortcut : GShortcut.shortcut_t -> unit
    method set_mnemonics_modifiers : Ocgtk_gdk.Gdk.modifiertype -> unit
    method set_scope : Gtk_enums.shortcutscope -> unit
    method mnemonic_modifiers : Ocgtk_gdk.Gdk.modifiertype
    method set_mnemonic_modifiers : Ocgtk_gdk.Gdk.modifiertype -> unit
    method model : Ocgtk_gio.Gio.list_model_t
    method n_items : int
    method as_shortcut_controller : Shortcut_controller.t
end

class shortcut_controller : Shortcut_controller.t -> shortcut_controller_t

