class type vfs_t = object
    method get_file_for_path : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t
    method get_file_for_uri : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t
    method get_supported_uri_schemes : unit -> string array
    method is_active : unit -> bool
    method parse_name : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t
    method unregister_uri_scheme : string -> bool
    method as_vfs : Vfs.t
end

class vfs : Vfs.t -> vfs_t

