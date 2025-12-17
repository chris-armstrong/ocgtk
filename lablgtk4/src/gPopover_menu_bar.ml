(* High-level class for PopoverMenuBar *)
class popover_menu_bar (obj : Popover_menu_bar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Popover_menu_bar.as_widget obj)

  method add_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string -> bool =
    fun child id ->
      let child = child#as_widget in
      (Popover_menu_bar.add_child obj child id)

  method remove_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun child ->
      let child = child#as_widget in
      (Popover_menu_bar.remove_child obj child)

  method as_widget = (Popover_menu_bar.as_widget obj)
    method as_popover_menu_bar = obj
end

