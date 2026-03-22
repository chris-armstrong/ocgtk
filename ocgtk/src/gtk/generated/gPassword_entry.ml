(* Signal class defined in gpassword_entry_signals.ml *)

class type password_entry_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gpassword_entry_signals.password_entry_signals
    method get_extra_menu : unit -> Ocgtk_gio.Gio.menu_model_t option
    method get_show_peek_icon : unit -> bool
    method set_extra_menu : Ocgtk_gio.Gio.menu_model_t option -> unit
    method set_show_peek_icon : bool -> unit
    method activates_default : bool
    method set_activates_default : bool -> unit
    method placeholder_text : string
    method set_placeholder_text : string -> unit
    method as_password_entry : Password_entry.t
end

(* High-level class for PasswordEntry *)
class password_entry (obj : Password_entry.t) : password_entry_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gpassword_entry_signals.password_entry_signals obj

  method get_extra_menu : unit -> Ocgtk_gio.Gio.menu_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.menu_model ret) (Password_entry.get_extra_menu obj)

  method get_show_peek_icon : unit -> bool =
    fun () ->
      (Password_entry.get_show_peek_icon obj)

  method set_extra_menu : Ocgtk_gio.Gio.menu_model_t option -> unit =
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

