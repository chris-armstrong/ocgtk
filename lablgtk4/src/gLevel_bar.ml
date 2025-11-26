(* High-level class for LevelBar *)
class level_bar_skel (obj : Level_bar.t) = object (self)
  inherit GObj.widget_impl (Level_bar.as_widget obj)

end

class level_bar obj = object
  inherit level_bar_skel obj
end
