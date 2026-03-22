class type shortcuts_shortcut_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method accel_size_group : GSize_group.size_group_t
    method set_accel_size_group : GSize_group.size_group_t -> unit
    method accelerator : string
    method set_accelerator : string -> unit
    method action_name : string
    method set_action_name : string -> unit
    method direction : Gtk_enums.textdirection
    method icon : Ocgtk_gio.Gio.Icon.icon_t
    method set_icon : Ocgtk_gio.Gio.Icon.icon_t -> unit
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
    method title_size_group : GSize_group.size_group_t
    method set_title_size_group : GSize_group.size_group_t -> unit
    method as_shortcuts_shortcut : Shortcuts_shortcut.t
end

(* High-level class for ShortcutsShortcut *)
class shortcuts_shortcut (obj : Shortcuts_shortcut.t) : shortcuts_shortcut_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method accel_size_group = new GSize_group.size_group (Shortcuts_shortcut.get_accel_size_group obj)
  method set_accel_size_group : GSize_group.size_group_t -> unit  = fun v ->  Shortcuts_shortcut.set_accel_size_group obj v#as_size_group

  method accelerator = Shortcuts_shortcut.get_accelerator obj
  method set_accelerator v =  Shortcuts_shortcut.set_accelerator obj v

  method action_name = Shortcuts_shortcut.get_action_name obj
  method set_action_name v =  Shortcuts_shortcut.set_action_name obj v

  method direction = Shortcuts_shortcut.get_direction obj

  method icon = new Ocgtk_gio.Gio.Icon.icon (Shortcuts_shortcut.get_icon obj)
  method set_icon : Ocgtk_gio.Gio.Icon.icon_t -> unit  = fun v ->  Shortcuts_shortcut.set_icon obj v#as_icon

  method icon_set = Shortcuts_shortcut.get_icon_set obj
  method set_icon_set v =  Shortcuts_shortcut.set_icon_set obj v

  method shortcut_type = Shortcuts_shortcut.get_shortcut_type obj
  method set_shortcut_type v =  Shortcuts_shortcut.set_shortcut_type obj v

  method subtitle = Shortcuts_shortcut.get_subtitle obj
  method set_subtitle v =  Shortcuts_shortcut.set_subtitle obj v

  method subtitle_set = Shortcuts_shortcut.get_subtitle_set obj
  method set_subtitle_set v =  Shortcuts_shortcut.set_subtitle_set obj v

  method title = Shortcuts_shortcut.get_title obj
  method set_title v =  Shortcuts_shortcut.set_title obj v

  method title_size_group = new GSize_group.size_group (Shortcuts_shortcut.get_title_size_group obj)
  method set_title_size_group : GSize_group.size_group_t -> unit  = fun v ->  Shortcuts_shortcut.set_title_size_group obj v#as_size_group

    method as_shortcuts_shortcut = obj
end

