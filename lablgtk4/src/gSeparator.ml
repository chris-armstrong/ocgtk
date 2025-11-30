(* High-level class for Separator *)
class separator_skel (obj : Separator.t) = object (self)
  inherit GObj.widget_impl (Separator.as_widget obj)

end

class separator obj = object
  inherit separator_skel obj
end
