class type alert_dialog_t = object
  method choose_finish :
    Ocgio.Async_result.async_result_t -> (int, GError.t) result
  (** Finishes the [Gtk.AlertDialog.choose] call. *)

  method get_buttons : unit -> string array option
  (** Returns the button labels for the alert. *)

  method get_cancel_button : unit -> int
  (** Returns the index of the cancel button. *)

  method get_default_button : unit -> int
  (** Returns the index of the default button. *)

  method get_detail : unit -> string
  (** Returns the detail text that will be shown in the alert. *)

  method get_message : unit -> string
  (** Returns the message that will be shown in the alert. *)

  method get_modal : unit -> bool
  (** Returns whether the alert blocks interaction with the parent window while
      it is presented. *)

  method set_buttons : string array -> unit
  (** Sets the button labels for the alert. *)

  method set_cancel_button : int -> unit
  (** Sets the index of the cancel button.

      See [Gtk.AlertDialog:cancel-button] for details of how this value is used.
  *)

  method set_default_button : int -> unit
  (** Sets the index of the default button.

      See [Gtk.AlertDialog:default-button] for details of how this value is
      used. *)

  method set_detail : string -> unit
  (** Sets the detail text that will be shown in the alert. *)

  method set_message : string -> unit
  (** Sets the message that will be shown in the alert. *)

  method set_modal : bool -> unit
  (** Sets whether the alert blocks interaction with the parent window while it
      is presented. *)

  method show :
    Application_and__window_and__window_group.window_t option -> unit
  (** Shows the alert to the user.

      This function is a simpler version of [Gtk.AlertDialog.choose] intended
      for dialogs with a single button.

      If you want to cancel the dialog or if the alert has more than one button,
      you should use that function instead and provide it with a
      [Gio.Cancellable] and callback respectively. *)

  method as_alert_dialog : Raw.Alert_dialog.t
end

(* High-level class for AlertDialog *)
class alert_dialog (obj : Raw.Alert_dialog.t) : alert_dialog_t =
  object (self)
    method choose_finish :
        Ocgio.Async_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Alert_dialog.choose_finish obj result

    method get_buttons : unit -> string array option =
      fun () -> Raw.Alert_dialog.get_buttons obj

    method get_cancel_button : unit -> int =
      fun () -> Raw.Alert_dialog.get_cancel_button obj

    method get_default_button : unit -> int =
      fun () -> Raw.Alert_dialog.get_default_button obj

    method get_detail : unit -> string =
      fun () -> Raw.Alert_dialog.get_detail obj

    method get_message : unit -> string =
      fun () -> Raw.Alert_dialog.get_message obj

    method get_modal : unit -> bool = fun () -> Raw.Alert_dialog.get_modal obj

    method set_buttons : string array -> unit =
      fun labels -> Raw.Alert_dialog.set_buttons obj labels

    method set_cancel_button : int -> unit =
      fun button -> Raw.Alert_dialog.set_cancel_button obj button

    method set_default_button : int -> unit =
      fun button -> Raw.Alert_dialog.set_default_button obj button

    method set_detail : string -> unit =
      fun detail -> Raw.Alert_dialog.set_detail obj detail

    method set_message : string -> unit =
      fun message -> Raw.Alert_dialog.set_message obj message

    method set_modal : bool -> unit =
      fun modal -> Raw.Alert_dialog.set_modal obj modal

    method show :
        Application_and__window_and__window_group.window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Alert_dialog.show obj parent

    method as_alert_dialog = obj
  end
