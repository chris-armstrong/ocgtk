(* High-level class for DropDown *)
class drop_down_skel (obj : Drop_down.t) = object (self)
  inherit GObj.widget_impl (Drop_down.as_widget obj)

end

class drop_down obj = object
  inherit drop_down_skel obj
end
