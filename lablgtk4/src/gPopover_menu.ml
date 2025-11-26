(* High-level class for PopoverMenu *)
class popover_menu_skel (obj : Popover_menu.t) = object (self)
  inherit GObj.widget_impl (Popover_menu.as_widget obj)

end

class popover_menu obj = object
  inherit popover_menu_skel obj
end
