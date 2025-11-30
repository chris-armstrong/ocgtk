(* High-level class for WindowControls *)
class window_controls_skel (obj : Window_controls.t) = object (self)
  inherit GObj.widget_impl (Window_controls.as_widget obj)

end

class window_controls obj = object
  inherit window_controls_skel obj
end
