class alert_dialog : Alert_dialog.t ->
  object
    method get_cancel_button : unit -> int
    method get_default_button : unit -> int
    method get_detail : unit -> string
    method get_message : unit -> string
    method get_modal : unit -> bool
    method set_cancel_button : int -> unit
    method set_default_button : int -> unit
    method set_detail : string -> unit
    method set_message : string -> unit
    method set_modal : bool -> unit
    method show : #GApplication_and__window_and__window_group.window option -> unit
    method as_alert_dialog : Alert_dialog.t
  end

