(* High-level class for EditableLabel *)
class editable_label_skel (obj : Editable_label.t) = object (self)
  inherit GObj.widget_impl (Editable_label.as_widget obj)

end

class editable_label obj = object
  inherit editable_label_skel obj
end
