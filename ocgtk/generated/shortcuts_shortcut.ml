class type shortcuts_shortcut_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method set_accel_size_group : Size_group.size_group_t -> unit
  method accelerator : string
  method set_accelerator : string -> unit
  method action_name : string
  method set_action_name : string -> unit
  method direction : Enums.textdirection
  method icon : Ocgio.Icon.icon_t
  method set_icon : Ocgio.Icon.icon_t -> unit
  method icon_set : bool
  method set_icon_set : bool -> unit
  method shortcut_type : Enums.shortcuttype
  method set_shortcut_type : Enums.shortcuttype -> unit
  method subtitle : string
  method set_subtitle : string -> unit
  method subtitle_set : bool
  method set_subtitle_set : bool -> unit
  method title : string
  method set_title : string -> unit
  method set_title_size_group : Size_group.size_group_t -> unit
  method as_shortcuts_shortcut : Raw.Shortcuts_shortcut.t
end

(* High-level class for ShortcutsShortcut *)
class shortcuts_shortcut (obj : Raw.Shortcuts_shortcut.t) : shortcuts_shortcut_t
  =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method set_accel_size_group : Size_group.size_group_t -> unit =
      fun v -> Raw.Shortcuts_shortcut.set_accel_size_group obj v#as_size_group

    method accelerator = Raw.Shortcuts_shortcut.get_accelerator obj
    method set_accelerator v = Raw.Shortcuts_shortcut.set_accelerator obj v
    method action_name = Raw.Shortcuts_shortcut.get_action_name obj
    method set_action_name v = Raw.Shortcuts_shortcut.set_action_name obj v
    method direction = Raw.Shortcuts_shortcut.get_direction obj
    method icon = new Ocgio.Icon.icon (Raw.Shortcuts_shortcut.get_icon obj)

    method set_icon : Ocgio.Icon.icon_t -> unit =
      fun v -> Raw.Shortcuts_shortcut.set_icon obj v#as_icon

    method icon_set = Raw.Shortcuts_shortcut.get_icon_set obj
    method set_icon_set v = Raw.Shortcuts_shortcut.set_icon_set obj v
    method shortcut_type = Raw.Shortcuts_shortcut.get_shortcut_type obj
    method set_shortcut_type v = Raw.Shortcuts_shortcut.set_shortcut_type obj v
    method subtitle = Raw.Shortcuts_shortcut.get_subtitle obj
    method set_subtitle v = Raw.Shortcuts_shortcut.set_subtitle obj v
    method subtitle_set = Raw.Shortcuts_shortcut.get_subtitle_set obj
    method set_subtitle_set v = Raw.Shortcuts_shortcut.set_subtitle_set obj v
    method title = Raw.Shortcuts_shortcut.get_title obj
    method set_title v = Raw.Shortcuts_shortcut.set_title obj v

    method set_title_size_group : Size_group.size_group_t -> unit =
      fun v -> Raw.Shortcuts_shortcut.set_title_size_group obj v#as_size_group

    method as_shortcuts_shortcut = obj
  end
