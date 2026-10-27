class type app_chooser_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit App_chooser.app_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_custom_item_activated :
    ?after:bool ->
    callback:(item_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method append_custom_item : string -> string -> Ocgio.Icon.icon_t -> unit
  (** Appends a custom item to the list of applications that is shown in the
      popup.

      The item name must be unique per-widget. Clients can use the provided name
      as a detail for the [Gtk.AppChooserButton::custom-item-activated] signal,
      to add a callback for the activation of a particular custom item in the
      list.

      See also [Gtk.AppChooserButton.append_separator]. *)

  method append_separator : unit -> unit
  (** Appends a separator to the list of applications that is shown in the
      popup. *)

  method get_heading : unit -> string option
  (** Returns the text to display at the top of the dialog. *)

  method get_modal : unit -> bool
  (** Gets whether the dialog is modal. *)

  method get_show_default_item : unit -> bool
  (** Returns whether the dropdown menu should show the default application at
      the top. *)

  method get_show_dialog_item : unit -> bool
  (** Returns whether the dropdown menu shows an item for a
      [GtkAppChooserDialog]. *)

  method set_active_custom_item : string -> unit
  (** Selects a custom item.

      See [Gtk.AppChooserButton.append_custom_item].

      Use [Gtk.AppChooser.refresh] to bring the selection to its initial state.
  *)

  method set_heading : string -> unit
  (** Sets the text to display at the top of the dialog.

      If the heading is not set, the dialog displays a default text. *)

  method set_modal : bool -> unit
  (** Sets whether the dialog should be modal. *)

  method set_show_default_item : bool -> unit
  (** Sets whether the dropdown menu of this button should show the default
      application for the given content type at top. *)

  method set_show_dialog_item : bool -> unit
  (** Sets whether the dropdown menu of this button should show an entry to
      trigger a [GtkAppChooserDialog]. *)

  method as_app_chooser_button : Raw.App_chooser_button.t
end

(* High-level class for AppChooserButton *)
class app_chooser_button (obj : Raw.App_chooser_button.t) : app_chooser_button_t
  =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit App_chooser.app_chooser (Raw.App_chooser.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.App_chooser_button.on_activate ~after self#as_app_chooser_button
        ~callback

    method on_changed ?(after = false) ~callback () =
      Raw.App_chooser_button.on_changed ~after self#as_app_chooser_button
        ~callback

    method on_custom_item_activated ?(after = false) ~callback () =
      Raw.App_chooser_button.on_custom_item_activated ~after
        self#as_app_chooser_button ~callback

    method append_custom_item : string -> string -> Ocgio.Icon.icon_t -> unit =
      fun name label icon ->
        let icon = icon#as_icon in
        Raw.App_chooser_button.append_custom_item obj name label icon

    method append_separator : unit -> unit =
      fun () -> Raw.App_chooser_button.append_separator obj

    method get_heading : unit -> string option =
      fun () -> Raw.App_chooser_button.get_heading obj

    method get_modal : unit -> bool =
      fun () -> Raw.App_chooser_button.get_modal obj

    method get_show_default_item : unit -> bool =
      fun () -> Raw.App_chooser_button.get_show_default_item obj

    method get_show_dialog_item : unit -> bool =
      fun () -> Raw.App_chooser_button.get_show_dialog_item obj

    method set_active_custom_item : string -> unit =
      fun name -> Raw.App_chooser_button.set_active_custom_item obj name

    method set_heading : string -> unit =
      fun heading -> Raw.App_chooser_button.set_heading obj heading

    method set_modal : bool -> unit =
      fun modal -> Raw.App_chooser_button.set_modal obj modal

    method set_show_default_item : bool -> unit =
      fun setting -> Raw.App_chooser_button.set_show_default_item obj setting

    method set_show_dialog_item : bool -> unit =
      fun setting -> Raw.App_chooser_button.set_show_dialog_item obj setting

    method as_app_chooser_button = obj
  end

let new_ (content_type : string) : app_chooser_button_t =
  let obj_ = Raw.App_chooser_button.new_ content_type in
  new app_chooser_button obj_
