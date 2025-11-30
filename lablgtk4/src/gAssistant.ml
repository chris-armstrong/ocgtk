(* High-level class for Assistant *)
class assistant_skel (obj : Assistant.t) = object (self)
  inherit GObj.widget_impl (Assistant.as_widget obj)

end

class assistant obj = object
  inherit assistant_skel obj
end
