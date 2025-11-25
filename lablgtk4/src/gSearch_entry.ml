(* High-level class for SearchEntry *)
class search_entry_skel (obj : Search_entry.t) = object (self)
  inherit GObj.widget_impl (Search_entry.as_widget obj)

end

class search_entry obj = object
  inherit search_entry_skel obj
end
