(* High-level class for Calendar *)
class calendar_skel (obj : Calendar.t) = object (self)
  inherit GObj.widget_impl (Calendar.as_widget obj)

end

class calendar obj = object
  inherit calendar_skel obj
end
