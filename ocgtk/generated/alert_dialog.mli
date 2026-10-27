(** Collects the arguments that are needed to present a message to the user.

    The message is shown with the [Gtk.AlertDialog.choose] function.

    If you don't need to wait for a button to be clicked, you can use
    [Gtk.AlertDialog.show].

    Its methods, signals and properties are on {!class-type-alert_dialog_t}. The
    functions it is built on are in {!Ocgtk.Raw.Alert_dialog}. *)

(** The methods, signals and properties of a [GtkAlertDialog]. *)
class type alert_dialog_t = object
  method choose_finish :
    Ocgio.Async_result.async_result_t -> (int, GError.t) result

  method get_buttons : unit -> string array option
  method get_cancel_button : unit -> int
  method get_default_button : unit -> int
  method get_detail : unit -> string
  method get_message : unit -> string
  method get_modal : unit -> bool
  method set_buttons : string array -> unit
  method set_cancel_button : int -> unit
  method set_default_button : int -> unit
  method set_detail : string -> unit
  method set_message : string -> unit
  method set_modal : bool -> unit

  method show :
    Application_and__window_and__window_group.window_t option -> unit

  method as_alert_dialog : Raw.Alert_dialog.t
end

class alert_dialog : Raw.Alert_dialog.t -> alert_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Alert_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAlertDialog], give one already wrapped. *)
