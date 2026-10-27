(** Entry point for using GIO functionality.

    Its methods, signals and properties are on {!class-type-vfs_t}. The
    functions it is built on are in {!Ocgio.Raw.Vfs}. *)

(** The methods, signals and properties of a [GVfs]. *)
class type vfs_t = object
  method get_file_for_path : string -> App_info_cycle_64c425a0.file_t
  method get_file_for_uri : string -> App_info_cycle_64c425a0.file_t
  method get_supported_uri_schemes : unit -> string array
  method is_active : unit -> bool
  method parse_name : string -> App_info_cycle_64c425a0.file_t
  method unregister_uri_scheme : string -> bool
  method as_vfs : Raw.Vfs.t
end

class vfs : Raw.Vfs.t -> vfs_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Vfs.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GVfs], give one already wrapped. *)
