(* High-level class for ListView *)
class list_view_skel (obj : List_view.t) = object (self)
  inherit GObj.widget_impl (List_view.as_widget obj)

end

class list_view obj = object
  inherit list_view_skel obj
end
