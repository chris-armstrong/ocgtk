(** Collects the arguments that are needed to present a message to the user.

    The message is shown with the [Gtk.AlertDialog.choose] function.

    If you don't need to wait for a button to be clicked, you can use
    [Gtk.AlertDialog.show].

    Its methods, signals and properties are on {!class-type-alert_dialog_t}. The
    functions it is built on are in {!Ocgtk.Raw.Alert_dialog}. *)

(** The methods, signals and properties of a [AlertDialog]. *)
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

class alert_dialog : Raw.Alert_dialog.t -> alert_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.Alert_dialog.t}. *)
