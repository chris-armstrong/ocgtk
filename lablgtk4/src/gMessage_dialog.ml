(* High-level class for MessageDialog *)
class message_dialog_skel (obj : Message_dialog.t) = object (self)
  inherit GObj.widget_impl (Message_dialog.as_widget obj)

end

class message_dialog obj = object
  inherit message_dialog_skel obj
end
