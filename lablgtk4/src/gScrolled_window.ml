(* High-level class for ScrolledWindow *)
class scrolled_window_skel (obj : Scrolled_window.t) = object (self)
  inherit GObj.widget_impl (Scrolled_window.as_widget obj)

end

class scrolled_window obj = object
  inherit scrolled_window_skel obj
end
