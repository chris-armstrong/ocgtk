class shortcuts_shortcut : Shortcuts_shortcut.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method accel_size_group : GSize_group.size_group
    method set_accel_size_group : #GSize_group.size_group -> unit
    method accelerator : string
    method set_accelerator : string -> unit
    method action_name : string
    method set_action_name : string -> unit
    method direction : Gtk_enums.textdirection
    method set_direction : Gtk_enums.textdirection -> unit
    method icon_set : bool
    method set_icon_set : bool -> unit
    method shortcut_type : Gtk_enums.shortcuttype
    method set_shortcut_type : Gtk_enums.shortcuttype -> unit
    method subtitle : string
    method set_subtitle : string -> unit
    method subtitle_set : bool
    method set_subtitle_set : bool -> unit
    method title : string
    method set_title : string -> unit
    method title_size_group : GSize_group.size_group
    method set_title_size_group : #GSize_group.size_group -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_shortcuts_shortcut : Shortcuts_shortcut.t
  end

