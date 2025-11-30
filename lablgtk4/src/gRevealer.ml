(* High-level class for Revealer *)
class revealer_skel (obj : Revealer.t) = object (self)
  inherit GObj.widget_impl (Revealer.as_widget obj)

end

class revealer obj = object
  inherit revealer_skel obj
end
