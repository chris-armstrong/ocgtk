(* High-level class for CenterBox *)
class center_box_skel (obj : Center_box.t) = object (self)
  inherit GObj.widget_impl (Center_box.as_widget obj)

end

class center_box obj = object
  inherit center_box_skel obj
end
