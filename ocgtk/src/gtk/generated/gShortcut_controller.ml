(* High-level class for ShortcutController *)
class shortcut_controller (obj : Shortcut_controller.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Shortcut_controller.as_event_controller obj)

  method add_shortcut : 'p1. (#GShortcut.shortcut as 'p1) -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcut in
      (Shortcut_controller.add_shortcut obj shortcut)

  method get_scope : unit -> Gtk_enums.shortcutscope =
    fun () ->
      (Shortcut_controller.get_scope obj)

  method remove_shortcut : 'p1. (#GShortcut.shortcut as 'p1) -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcut in
      (Shortcut_controller.remove_shortcut obj shortcut)

  method set_scope : Gtk_enums.shortcutscope -> unit =
    fun scope ->
      (Shortcut_controller.set_scope obj scope)

  method n_items = Shortcut_controller.get_n_items obj

  method as_event_controller = (Shortcut_controller.as_event_controller obj)
    method as_shortcut_controller = obj
end

