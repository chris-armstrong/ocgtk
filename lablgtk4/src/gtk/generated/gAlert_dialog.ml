(* High-level class for AlertDialog *)
class alert_dialog (obj : Alert_dialog.t) = object (self)

  method cancel_button = Alert_dialog.get_cancel_button obj
  method set_cancel_button v = Alert_dialog.set_cancel_button obj v

  method default_button = Alert_dialog.get_default_button obj
  method set_default_button v = Alert_dialog.set_default_button obj v

  method detail = Alert_dialog.get_detail obj
  method set_detail v = Alert_dialog.set_detail obj v

  method message = Alert_dialog.get_message obj
  method set_message v = Alert_dialog.set_message obj v

  method modal = Alert_dialog.get_modal obj
  method set_modal v = Alert_dialog.set_modal obj v

  method get_buttons : unit -> unit = fun () -> (Alert_dialog.get_buttons obj )

  method show : 'p1. (#GApplication_and__window_and__window_group.window as 'p1) option -> unit =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Alert_dialog.show obj parent)

    method as_alert_dialog = obj
end

