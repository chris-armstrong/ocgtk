(* High-level class for ListBoxRow *)
class list_box_row_skel (obj : List_box_row.t) = object (self)
  inherit GObj.widget_impl (List_box_row.as_widget obj)

end

class list_box_row obj = object
  inherit list_box_row_skel obj
end
