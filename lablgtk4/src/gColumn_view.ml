(* High-level class for ColumnView *)
class column_view_skel (obj : Column_view.t) = object (self)
  inherit GObj.widget_impl (Column_view.as_widget obj)

end

class column_view obj = object
  inherit column_view_skel obj
end
