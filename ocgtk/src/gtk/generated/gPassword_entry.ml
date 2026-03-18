(* Signal class defined in gpassword_entry_signals.ml *)

(* High-level class for PasswordEntry *)
class password_entry (obj : Password_entry.t) = object (self)
  inherit Gpassword_entry_signals.password_entry_signals obj

  method get_extra_menu : unit -> Ocgtk_gio.Gio.menu_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.menu_model ret) (Password_entry.get_extra_menu obj)

  method get_show_peek_icon : unit -> bool =
    fun () ->
      (Password_entry.get_show_peek_icon obj)

  method set_extra_menu : 'p1. (#Ocgtk_gio.Gio.menu_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Password_entry.set_extra_menu obj model)

  method set_show_peek_icon : bool -> unit =
    fun show_peek_icon ->
      (Password_entry.set_show_peek_icon obj show_peek_icon)

  method activates_default = Password_entry.get_activates_default obj
  method set_activates_default v =  Password_entry.set_activates_default obj v

  method placeholder_text = Password_entry.get_placeholder_text obj
  method set_placeholder_text v =  Password_entry.set_placeholder_text obj v

    method as_password_entry = obj
end

