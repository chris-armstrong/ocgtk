(* High-level class for ListBase *)
class list_base_skel (obj : List_base.t) = object (self)
  inherit GObj.widget_impl (List_base.as_widget obj)

end

class list_base obj = object
  inherit list_base_skel obj
end
