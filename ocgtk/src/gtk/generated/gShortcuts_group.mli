class shortcuts_group : Shortcuts_group.t ->
  object
    method add_shortcut : #GShortcuts_shortcut.shortcuts_shortcut -> unit
    method accel_size_group : GSize_group.size_group
    method set_accel_size_group : #GSize_group.size_group -> unit
    method height : int
    method title : string
    method set_title : string -> unit
    method title_size_group : GSize_group.size_group
    method set_title_size_group : #GSize_group.size_group -> unit
    method view : string
    method set_view : string -> unit
    method as_shortcuts_group : Shortcuts_group.t
  end

