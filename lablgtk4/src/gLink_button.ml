(* High-level class for LinkButton *)
class link_button_skel (obj : Link_button.t) = object (self)
  inherit GObj.widget_impl (Link_button.as_widget obj)

end

class link_button obj = object
  inherit link_button_skel obj
end
