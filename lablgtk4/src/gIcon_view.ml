(* High-level class for IconView *)
class icon_view_skel (obj : Icon_view.t) = object (self)
  inherit GObj.widget_impl (Icon_view.as_widget obj)

end

class icon_view obj = object
  inherit icon_view_skel obj
end
