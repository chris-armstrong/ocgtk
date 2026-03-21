class type shortcut_controller_t = object
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

(* High-level class for ShortcutController *)
class shortcut_controller (obj : Shortcut_controller.t) : shortcut_controller_t = object (self)

  method add_shortcut : GShortcut.shortcut_t -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcut in
      (Shortcut_controller.add_shortcut obj shortcut)

  method get_mnemonics_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype =
    fun () ->
      (Shortcut_controller.get_mnemonics_modifiers obj)

  method get_scope : unit -> Gtk_enums.shortcutscope =
    fun () ->
      (Shortcut_controller.get_scope obj)

  method remove_shortcut : GShortcut.shortcut_t -> unit =
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

