(* Signal class defined in gdrive_signals.ml *)

(* High-level class for Drive *)
class drive (obj : Drive.t) = object (self)
  inherit Gdrive_signals.drive_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (Drive.can_eject obj)

  method can_poll_for_media : unit -> bool =
    fun () ->
      (Drive.can_poll_for_media obj)

  method can_start : unit -> bool =
    fun () ->
      (Drive.can_start obj)

  method can_start_degraded : unit -> bool =
    fun () ->
      (Drive.can_start_degraded obj)

  method can_stop : unit -> bool =
    fun () ->
      (Drive.can_stop obj)

  method get_identifier : string -> string option =
    fun kind ->
      (Drive.get_identifier obj kind)

  method get_name : unit -> string =
    fun () ->
      (Drive.get_name obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (Drive.get_sort_key obj)

  method get_start_stop_type : unit -> Gio_enums.drivestartstoptype =
    fun () ->
      (Drive.get_start_stop_type obj)

  method has_media : unit -> bool =
    fun () ->
      (Drive.has_media obj)

  method has_volumes : unit -> bool =
    fun () ->
      (Drive.has_volumes obj)

  method is_media_check_automatic : unit -> bool =
    fun () ->
      (Drive.is_media_check_automatic obj)

  method is_media_removable : unit -> bool =
    fun () ->
      (Drive.is_media_removable obj)

  method is_removable : unit -> bool =
    fun () ->
      (Drive.is_removable obj)

    method as_drive = obj
end

