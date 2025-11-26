(* High-level class for InfoBar *)
class info_bar_skel (obj : Info_bar.t) = object (self)
  inherit GObj.widget_impl (Info_bar.as_widget obj)

end

class info_bar obj = object
  inherit info_bar_skel obj
end
