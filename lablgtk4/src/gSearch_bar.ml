(* High-level class for SearchBar *)
class search_bar_skel (obj : Search_bar.t) = object (self)
  inherit GObj.widget_impl (Search_bar.as_widget obj)

end

class search_bar obj = object
  inherit search_bar_skel obj
end
