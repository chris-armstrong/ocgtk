(* High-level class for TextView *)
class text_view_skel (obj : Text_view.t) = object (self)
  inherit GObj.widget_impl (Text_view.as_widget obj)

end

class text_view obj = object
  inherit text_view_skel obj
end
