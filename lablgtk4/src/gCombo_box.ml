(* High-level class for ComboBox *)
class combo_box_skel (obj : Combo_box.t) = object (self)
  inherit GObj.widget_impl (Combo_box.as_widget obj)

end

class combo_box obj = object
  inherit combo_box_skel obj
end
