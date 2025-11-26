(* High-level class for Switch *)
class switch_skel (obj : Switch.t) = object (self)
  inherit GObj.widget_impl (Switch.as_widget obj)

end

class switch obj = object
  inherit switch_skel obj
end
