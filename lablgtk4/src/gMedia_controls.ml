(* High-level class for MediaControls *)
class media_controls_skel (obj : Media_controls.t) = object (self)
  inherit GObj.widget_impl (Media_controls.as_widget obj)

end

class media_controls obj = object
  inherit media_controls_skel obj
end
