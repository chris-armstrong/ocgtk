class shortcut_controller : Shortcut_controller.t ->
  object
    method add_shortcut : #GShortcut.shortcut -> unit
    method get_mnemonics_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype
    method get_scope : unit -> Gtk_enums.shortcutscope
    method remove_shortcut : #GShortcut.shortcut -> unit
    method set_mnemonics_modifiers : Ocgtk_gdk.Gdk.modifiertype -> unit
    method set_scope : Gtk_enums.shortcutscope -> unit
    method mnemonic_modifiers : Ocgtk_gdk.Gdk.modifiertype
    method set_mnemonic_modifiers : Ocgtk_gdk.Gdk.modifiertype -> unit
    method model : Ocgtk_gio.Gio.list_model
    method n_items : int
    method as_shortcut_controller : Shortcut_controller.t
  end

