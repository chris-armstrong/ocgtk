(* High-level class for AlertDialog *)
class alert_dialog (obj : Alert_dialog.t) = object (self)

  method get_cancel_button : unit -> int =
    fun () ->
      (Alert_dialog.get_cancel_button obj)

  method get_default_button : unit -> int =
    fun () ->
      (Alert_dialog.get_default_button obj)

  method get_detail : unit -> string =
    fun () ->
      (Alert_dialog.get_detail obj)

  method get_message : unit -> string =
    fun () ->
      (Alert_dialog.get_message obj)

  method get_modal : unit -> bool =
    fun () ->
      (Alert_dialog.get_modal obj)

  method set_cancel_button : int -> unit =
    fun button ->
      (Alert_dialog.set_cancel_button obj button)

  method set_default_button : int -> unit =
    fun button ->
      (Alert_dialog.set_default_button obj button)

  method set_detail : string -> unit =
    fun detail ->
      (Alert_dialog.set_detail obj detail)

  method set_message : string -> unit =
    fun message ->
      (Alert_dialog.set_message obj message)

  method set_modal : bool -> unit =
    fun modal ->
      (Alert_dialog.set_modal obj modal)

  method show : 'p1. (#GApplication_and__window_and__window_group.window as 'p1) option -> unit =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Alert_dialog.show obj parent)

    method as_alert_dialog = obj
end

