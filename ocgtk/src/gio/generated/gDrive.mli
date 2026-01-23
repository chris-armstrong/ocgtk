class drive : Drive.t ->
  object
    inherit Gdrive_signals.drive_signals
    method can_eject : unit -> bool
    method can_poll_for_media : unit -> bool
    method can_start : unit -> bool
    method can_start_degraded : unit -> bool
    method can_stop : unit -> bool
    method enumerate_identifiers : unit -> string array
    method get_icon : unit -> GIcon.icon
    method get_identifier : string -> string option
    method get_name : unit -> string
    method get_sort_key : unit -> string option
    method get_start_stop_type : unit -> Gio_enums.drivestartstoptype
    method get_symbolic_icon : unit -> GIcon.icon
    method has_media : unit -> bool
    method has_volumes : unit -> bool
    method is_media_check_automatic : unit -> bool
    method is_media_removable : unit -> bool
    method is_removable : unit -> bool
    method as_drive : Drive.t
  end

