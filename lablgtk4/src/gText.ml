(* High-level class for Text *)
class text_skel (obj : Text.t) = object (self)
  inherit GObj.widget_impl (Text.as_widget obj)

end

class text obj = object
  inherit text_skel obj
end
