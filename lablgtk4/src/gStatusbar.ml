(* High-level class for Statusbar *)
class statusbar_skel (obj : Statusbar.t) = object (self)
  inherit GObj.widget_impl (Statusbar.as_widget obj)

end

class statusbar obj = object
  inherit statusbar_skel obj
end
