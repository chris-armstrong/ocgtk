class shortcut_controller : Shortcut_controller.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    method add_shortcut : #GShortcut.shortcut -> unit
    method get_scope : unit -> Gtk_enums.shortcutscope
    method remove_shortcut : #GShortcut.shortcut -> unit
    method set_scope : Gtk_enums.shortcutscope -> unit
    method n_items : int
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_shortcut_controller : Shortcut_controller.t
  end

