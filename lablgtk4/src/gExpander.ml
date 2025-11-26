(* High-level class for Expander *)
class expander_skel (obj : Expander.t) = object (self)
  inherit GObj.widget_impl (Expander.as_widget obj)

end

class expander obj = object
  inherit expander_skel obj
end
