(* High-level class for Label *)
class label_skel (obj : Label.t) = object (self)
  inherit GObj.widget_impl (Label.as_widget obj)

end

class label obj = object
  inherit label_skel obj
end
