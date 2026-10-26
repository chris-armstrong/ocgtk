class type vfs_t = object
  method get_file_for_path : string -> GApp_info_cycle_64c425a0.file_t
  method get_file_for_uri : string -> GApp_info_cycle_64c425a0.file_t
  method get_supported_uri_schemes : unit -> string array
  method is_active : unit -> bool
  method parse_name : string -> GApp_info_cycle_64c425a0.file_t
  method unregister_uri_scheme : string -> bool
  method as_vfs : Vfs.t
end

(* High-level class for Vfs *)
class vfs (obj : Vfs.t) : vfs_t =
  object (self)
    method get_file_for_path : string -> GApp_info_cycle_64c425a0.file_t =
      fun path ->
        new GApp_info_cycle_64c425a0.file (Vfs.get_file_for_path obj path)

    method get_file_for_uri : string -> GApp_info_cycle_64c425a0.file_t =
      fun uri ->
        new GApp_info_cycle_64c425a0.file (Vfs.get_file_for_uri obj uri)

    method get_supported_uri_schemes : unit -> string array =
      fun () -> Vfs.get_supported_uri_schemes obj

    method is_active : unit -> bool = fun () -> Vfs.is_active obj

    method parse_name : string -> GApp_info_cycle_64c425a0.file_t =
      fun parse_name ->
        new GApp_info_cycle_64c425a0.file (Vfs.parse_name obj parse_name)

    method unregister_uri_scheme : string -> bool =
      fun scheme -> Vfs.unregister_uri_scheme obj scheme

    method as_vfs = obj
  end
