(* High-level class for GLArea *)
class g_l_area_skel (obj : G_l_area.t) = object (self)
  inherit GObj.widget_impl (G_l_area.as_widget obj)

end

class g_l_area obj = object
  inherit g_l_area_skel obj
end
