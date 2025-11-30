(* High-level class for DrawingArea *)
class drawing_area_skel (obj : Drawing_area.t) = object (self)
  inherit GObj.widget_impl (Drawing_area.as_widget obj)

end

class drawing_area obj = object
  inherit drawing_area_skel obj
end
