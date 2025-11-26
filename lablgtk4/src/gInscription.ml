(* High-level class for Inscription *)
class inscription_skel (obj : Inscription.t) = object (self)
  inherit GObj.widget_impl (Inscription.as_widget obj)

end

class inscription obj = object
  inherit inscription_skel obj
end
