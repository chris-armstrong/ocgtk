(* High-level class for Picture *)
class picture_skel (obj : Picture.t) = object (self)
  inherit GObj.widget_impl (Picture.as_widget obj)

end

class picture obj = object
  inherit picture_skel obj
end
