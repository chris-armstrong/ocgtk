(* High-level class for ApplicationWindow *)
class application_window_skel (obj : Application_window.t) = object (self)
  inherit GObj.widget_impl (Application_window.as_widget obj)

end

class application_window obj = object
  inherit application_window_skel obj
end
