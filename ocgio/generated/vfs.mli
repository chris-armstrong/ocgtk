class type vfs_t = object
  method get_file_for_path : string -> GApp_info_cycle_64c425a0.file_t
  method get_file_for_uri : string -> GApp_info_cycle_64c425a0.file_t
  method get_supported_uri_schemes : unit -> string array
  method is_active : unit -> bool
  method parse_name : string -> GApp_info_cycle_64c425a0.file_t
  method unregister_uri_scheme : string -> bool
  method as_vfs : Vfs.t
end

class vfs : Vfs.t -> vfs_t
