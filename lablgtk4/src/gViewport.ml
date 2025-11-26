(* High-level class for Viewport *)
class viewport_skel (obj : Viewport.t) = object (self)
  inherit GObj.widget_impl (Viewport.as_widget obj)

end

class viewport obj = object
  inherit viewport_skel obj
end
