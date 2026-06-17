class type shortcuts_group_t = object
  inherit GBox.box_t
  method add_shortcut : GShortcuts_shortcut.shortcuts_shortcut_t -> unit
  method set_accel_size_group : GSize_group.size_group_t -> unit
  method height : int
  method title : string
  method set_title : string -> unit
  method set_title_size_group : GSize_group.size_group_t -> unit
  method view : string
  method set_view : string -> unit
  method as_shortcuts_group : Shortcuts_group.t
end

class shortcuts_group : Shortcuts_group.t -> shortcuts_group_t
