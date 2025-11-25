(* High-level class for HeaderBar *)
class header_bar_skel (obj : Header_bar.t) = object (self)
  inherit GObj.widget_impl (Header_bar.as_widget obj)

end

class header_bar obj = object
  inherit header_bar_skel obj
end
