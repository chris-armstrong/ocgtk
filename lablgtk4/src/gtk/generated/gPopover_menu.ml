(* High-level class for PopoverMenu *)
class popover_menu (obj : Popover_menu.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Popover_menu.as_widget obj)

  method add_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string -> bool =
    fun child id ->
      let child = child#as_widget in
      (Popover_menu.add_child obj child id)

  method remove_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun child ->
      let child = child#as_widget in
      (Popover_menu.remove_child obj child)

  method visible_submenu = Popover_menu.get_visible_submenu obj
  method set_visible_submenu v =  Popover_menu.set_visible_submenu obj v

  method as_widget = (Popover_menu.as_widget obj)
    method as_popover_menu = obj
end

