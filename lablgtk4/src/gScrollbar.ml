(* High-level class for Scrollbar *)
class scrollbar_skel (obj : Scrollbar.t) = object (self)
  inherit GObj.widget_impl (Scrollbar.as_widget obj)

end

class scrollbar obj = object
  inherit scrollbar_skel obj
end
