(* High-level class for Entry *)
class entry_skel (obj : Entry.t) = object (self)
  inherit GObj.widget_impl (Entry.as_widget obj)

end

class entry obj = object
  inherit entry_skel obj
end
