class type password_entry_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the menu model set with gtk_password_entry_set_extra_menu(). *)

  method get_show_peek_icon : unit -> bool
  (** Returns whether the entry is showing an icon to reveal the contents. *)

  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model to add when constructing the context menu for [entry].
  *)

  method set_show_peek_icon : bool -> unit
  (** Sets whether the entry should have a clickable icon to reveal the
      contents.

      Setting this to [FALSE] also hides the text again. *)

  method activates_default : bool
  method set_activates_default : bool -> unit
  method placeholder_text : string
  method set_placeholder_text : string -> unit
  method as_password_entry : Raw.Password_entry.t
end

(* High-level class for PasswordEntry *)
class password_entry (obj : Raw.Password_entry.t) : password_entry_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Editable.editable (Raw.Editable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Password_entry.on_activate ~after self#as_password_entry ~callback

    method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Password_entry.get_extra_menu obj)

    method get_show_peek_icon : unit -> bool =
      fun () -> Raw.Password_entry.get_show_peek_icon obj

    method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Password_entry.set_extra_menu obj model

    method set_show_peek_icon : bool -> unit =
      fun show_peek_icon ->
        Raw.Password_entry.set_show_peek_icon obj show_peek_icon

    method activates_default = Raw.Password_entry.get_activates_default obj

    method set_activates_default v =
      Raw.Password_entry.set_activates_default obj v

    method placeholder_text = Raw.Password_entry.get_placeholder_text obj

    method set_placeholder_text v =
      Raw.Password_entry.set_placeholder_text obj v

    method as_password_entry = obj
  end

let new_ () : password_entry_t = new password_entry (Raw.Password_entry.new_ ())
