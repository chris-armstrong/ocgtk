(* High-level class for Image *)
class image_skel (obj : Image.t) = object (self)
  inherit GObj.widget_impl (Image.as_widget obj)

end

class image obj = object
  inherit image_skel obj
end
