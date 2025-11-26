(* High-level class for WindowHandle *)
class window_handle_skel (obj : Window_handle.t) = object (self)
  inherit GObj.widget_impl (Window_handle.as_widget obj)

end

class window_handle obj = object
  inherit window_handle_skel obj
end
