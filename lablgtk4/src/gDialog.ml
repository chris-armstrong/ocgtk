(* High-level class for Dialog *)
class dialog_skel (obj : Dialog.t) = object (self)
  inherit GObj.widget_impl (Dialog.as_widget obj)

end

class dialog obj = object
  inherit dialog_skel obj
end
