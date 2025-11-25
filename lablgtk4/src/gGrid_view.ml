(* High-level class for GridView *)
class grid_view_skel (obj : Grid_view.t) = object (self)
  inherit GObj.widget_impl (Grid_view.as_widget obj)

end

class grid_view obj = object
  inherit grid_view_skel obj
end
