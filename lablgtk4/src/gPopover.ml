(* High-level class for Popover *)
class popover_skel (obj : Popover.t) = object (self)
  inherit GObj.widget_impl (Popover.as_widget obj)

end

class popover obj = object
  inherit popover_skel obj
end
