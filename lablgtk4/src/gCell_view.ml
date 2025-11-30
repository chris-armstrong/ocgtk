(* High-level class for CellView *)
class cell_view_skel (obj : Cell_view.t) = object (self)
  inherit GObj.widget_impl (Cell_view.as_widget obj)

end

class cell_view obj = object
  inherit cell_view_skel obj
end
