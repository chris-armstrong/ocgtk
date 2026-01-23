(* High-level class for Vfs *)
class vfs (obj : Vfs.t) = object (self)

  method get_file_for_path : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file =
    fun path ->
      new  GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file(Vfs.get_file_for_path obj path)

  method get_file_for_uri : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file =
    fun uri ->
      new  GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file(Vfs.get_file_for_uri obj uri)

  method get_supported_uri_schemes : unit -> string array =
    fun () ->
      (Vfs.get_supported_uri_schemes obj)

  method is_active : unit -> bool =
    fun () ->
      (Vfs.is_active obj)

  method parse_name : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file =
    fun parse_name ->
      new  GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file(Vfs.parse_name obj parse_name)

  method unregister_uri_scheme : string -> bool =
    fun scheme ->
      (Vfs.unregister_uri_scheme obj scheme)

    method as_vfs = obj
end

