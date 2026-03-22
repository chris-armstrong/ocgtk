class type shortcuts_group_t = object
    inherit GBox.box_t
    method add_shortcut : GShortcuts_shortcut.shortcuts_shortcut_t -> unit
    method accel_size_group : GSize_group.size_group_t
    method set_accel_size_group : GSize_group.size_group_t -> unit
    method height : int
    method title : string
    method set_title : string -> unit
    method title_size_group : GSize_group.size_group_t
    method set_title_size_group : GSize_group.size_group_t -> unit
    method view : string
    method set_view : string -> unit
    method as_shortcuts_group : Shortcuts_group.t
end

(* High-level class for ShortcutsGroup *)
class shortcuts_group (obj : Shortcuts_group.t) : shortcuts_group_t = object (self)
  inherit GBox.box (Obj.magic obj : Box.t)

  method add_shortcut : GShortcuts_shortcut.shortcuts_shortcut_t -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcuts_shortcut in
      (Shortcuts_group.add_shortcut obj shortcut)

  method accel_size_group = new GSize_group.size_group (Shortcuts_group.get_accel_size_group obj)
  method set_accel_size_group : GSize_group.size_group_t -> unit  = fun v ->  Shortcuts_group.set_accel_size_group obj v#as_size_group

  method height = Shortcuts_group.get_height obj

  method title = Shortcuts_group.get_title obj
  method set_title v =  Shortcuts_group.set_title obj v

  method title_size_group = new GSize_group.size_group (Shortcuts_group.get_title_size_group obj)
  method set_title_size_group : GSize_group.size_group_t -> unit  = fun v ->  Shortcuts_group.set_title_size_group obj v#as_size_group

  method view = Shortcuts_group.get_view obj
  method set_view v =  Shortcuts_group.set_view obj v

    method as_shortcuts_group = obj
end

