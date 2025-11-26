(* High-level class for DragIcon *)
class drag_icon_skel (obj : Drag_icon.t) = object (self)
  inherit GObj.widget_impl (Drag_icon.as_widget obj)

end

class drag_icon obj = object
  inherit drag_icon_skel obj
end
