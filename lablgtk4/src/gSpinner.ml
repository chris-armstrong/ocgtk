(* High-level class for Spinner *)
class spinner_skel (obj : Spinner.t) = object (self)
  inherit GObj.widget_impl (Spinner.as_widget obj)

end

class spinner obj = object
  inherit spinner_skel obj
end
