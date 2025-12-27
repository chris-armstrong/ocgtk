class vfs : Vfs.t ->
  object
    method get_file_for_path : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file
    method get_file_for_uri : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file
    method is_active : unit -> bool
    method parse_name : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file
    method unregister_uri_scheme : string -> bool
    method as_vfs : Vfs.t
  end

