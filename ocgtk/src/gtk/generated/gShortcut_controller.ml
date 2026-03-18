(* High-level class for ShortcutController *)
class shortcut_controller (obj : Shortcut_controller.t) = object (self)

  method add_shortcut : 'p1. (#GShortcut.shortcut as 'p1) -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcut in
      (Shortcut_controller.add_shortcut obj shortcut)

  method get_mnemonics_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype =
    fun () ->
      (Shortcut_controller.get_mnemonics_modifiers obj)

  method get_scope : unit -> Gtk_enums.shortcutscope =
    fun () ->
      (Shortcut_controller.get_scope obj)

  method remove_shortcut : 'p1. (#GShortcut.shortcut as 'p1) -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcut in
      (Shortcut_controller.remove_shortcut obj shortcut)

  method set_mnemonics_modifiers : Ocgtk_gdk.Gdk.modifiertype -> unit =
    fun modifiers ->
      (Shortcut_controller.set_mnemonics_modifiers obj modifiers)

  method set_scope : Gtk_enums.shortcutscope -> unit =
    fun scope ->
      (Shortcut_controller.set_scope obj scope)

  method mnemonic_modifiers = Shortcut_controller.get_mnemonic_modifiers obj
  method set_mnemonic_modifiers v =  Shortcut_controller.set_mnemonic_modifiers obj v

  method model = new Ocgtk_gio.Gio.list_model (Shortcut_controller.get_model obj)

  method n_items = Shortcut_controller.get_n_items obj

    method as_shortcut_controller = obj
end

