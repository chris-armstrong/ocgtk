(* Signal class defined in gpassword_entry_signals.ml *)

(* High-level class for PasswordEntry *)
class password_entry (obj : Password_entry.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Password_entry.as_widget obj)

  inherit Gpassword_entry_signals.password_entry_signals obj

  method get_show_peek_icon : unit -> bool = fun () -> (Password_entry.get_show_peek_icon obj )

  method set_show_peek_icon : bool -> unit = fun show_peek_icon -> (Password_entry.set_show_peek_icon obj show_peek_icon)

  method as_widget = (Password_entry.as_widget obj)
    method as_password_entry = obj
end

