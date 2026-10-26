class type vfs_t = object
  method get_file_for_path : string -> App_info_cycle_64c425a0.file_t
  method get_file_for_uri : string -> App_info_cycle_64c425a0.file_t
  method get_supported_uri_schemes : unit -> string array
  method is_active : unit -> bool
  method parse_name : string -> App_info_cycle_64c425a0.file_t
  method unregister_uri_scheme : string -> bool
  method as_vfs : Raw.Vfs.t
end

(* High-level class for Vfs *)
class vfs (obj : Raw.Vfs.t) : vfs_t =
  object (self)
    method get_file_for_path : string -> App_info_cycle_64c425a0.file_t =
      fun path ->
        new App_info_cycle_64c425a0.file (Raw.Vfs.get_file_for_path obj path)

    method get_file_for_uri : string -> App_info_cycle_64c425a0.file_t =
      fun uri ->
        new App_info_cycle_64c425a0.file (Raw.Vfs.get_file_for_uri obj uri)

    method get_supported_uri_schemes : unit -> string array =
      fun () -> Raw.Vfs.get_supported_uri_schemes obj

    method is_active : unit -> bool = fun () -> Raw.Vfs.is_active obj

    method parse_name : string -> App_info_cycle_64c425a0.file_t =
      fun parse_name ->
        new App_info_cycle_64c425a0.file (Raw.Vfs.parse_name obj parse_name)

    method unregister_uri_scheme : string -> bool =
      fun scheme -> Raw.Vfs.unregister_uri_scheme obj scheme

    method as_vfs = obj
  end
