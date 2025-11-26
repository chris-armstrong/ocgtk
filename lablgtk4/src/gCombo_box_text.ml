(* High-level class for ComboBoxText *)
class combo_box_text_skel (obj : Combo_box_text.t) = object (self)
  inherit GObj.widget_impl (Combo_box_text.as_widget obj)

end

class combo_box_text obj = object
  inherit combo_box_text_skel obj
end
