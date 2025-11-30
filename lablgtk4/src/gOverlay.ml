(* High-level class for Overlay *)
class overlay_skel (obj : Overlay.t) = object (self)
  inherit GObj.widget_impl (Overlay.as_widget obj)

end

class overlay obj = object
  inherit overlay_skel obj
end
