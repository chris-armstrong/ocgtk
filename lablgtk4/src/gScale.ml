(* High-level class for Scale *)
class scale_skel (obj : Scale.t) = object (self)
  inherit GObj.widget_impl (Scale.as_widget obj)

end

class scale obj = object
  inherit scale_skel obj
end
