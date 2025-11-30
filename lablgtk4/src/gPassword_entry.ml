(* High-level class for PasswordEntry *)
class password_entry_skel (obj : Password_entry.t) = object (self)
  inherit GObj.widget_impl (Password_entry.as_widget obj)

end

class password_entry obj = object
  inherit password_entry_skel obj
end
