class alert_dialog : Alert_dialog.t ->
  object
    method cancel_button : int
    method set_cancel_button : int -> unit
    method default_button : int
    method set_default_button : int -> unit
    method detail : string
    method set_detail : string -> unit
    method message : string
    method set_message : string -> unit
    method modal : bool
    method set_modal : bool -> unit
    method get_buttons : unit -> unit
    method show : #GApplication_and__window_and__window_group.window option -> unit
    method as_alert_dialog : Alert_dialog.t
  end

