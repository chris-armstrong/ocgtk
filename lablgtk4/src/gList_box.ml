(* High-level class for ListBox *)
class list_box_skel (obj : List_box.t) = object (self)
  inherit GObj.widget_impl (List_box.as_widget obj)

end

class list_box obj = object
  inherit list_box_skel obj
end
