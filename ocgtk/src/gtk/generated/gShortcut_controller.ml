class type shortcut_controller_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    inherit GBuildable.buildable_t
    method add_shortcut : GShortcut.shortcut_t -> unit
    method get_mnemonics_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype
    method get_scope : unit -> Gtk_enums.shortcutscope
    method remove_shortcut : GShortcut.shortcut_t -> unit
    method set_mnemonics_modifiers : Ocgtk_gdk.Gdk.modifiertype -> unit
    method set_scope : Gtk_enums.shortcutscope -> unit
    method item_type : int
    method mnemonic_modifiers : Ocgtk_gdk.Gdk.modifiertype
    method set_mnemonic_modifiers : Ocgtk_gdk.Gdk.modifiertype -> unit
    method n_items : int
    method as_shortcut_controller : Shortcut_controller.t
end

(* High-level class for ShortcutController *)
class shortcut_controller (obj : Shortcut_controller.t) : shortcut_controller_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)
  inherit Ocgtk_gio.Gio.List_model.list_model (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)
  inherit GBuildable.buildable (Buildable.from_gobject obj)

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

  method item_type = Shortcut_controller.get_item_type obj

  method mnemonic_modifiers = Shortcut_controller.get_mnemonic_modifiers obj
  method set_mnemonic_modifiers v =  Shortcut_controller.set_mnemonic_modifiers obj v

  method n_items = Shortcut_controller.get_n_items obj

    method as_shortcut_controller = obj
end

let new_ () : shortcut_controller_t =
  new shortcut_controller (Shortcut_controller.new_ ())

let new_for_model (model : Ocgtk_gio.Gio.List_model.list_model_t) : shortcut_controller_t =
  let model = model#as_list_model in
  let obj_ = Shortcut_controller.new_for_model model in
  new shortcut_controller obj_

