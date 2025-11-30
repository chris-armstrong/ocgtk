(* High-level class for PopoverMenuBar *)
class popover_menu_bar_skel (obj : Popover_menu_bar.t) = object (self)
  inherit GObj.widget_impl (Popover_menu_bar.as_widget obj)

end

class popover_menu_bar obj = object
  inherit popover_menu_bar_skel obj
end
