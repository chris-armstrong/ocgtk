(** Entry point for using GIO functionality.

    Its methods, signals and properties are on {!class-type-vfs_t}. The
    functions it is built on are in {!Ocgio.Raw.Vfs}. *)

(** The methods, signals and properties of a [GVfs]. *)
class type vfs_t = object
  method get_file_for_path : string -> App_info_cycle_64c425a0.file_t
  (** Gets a [GFile] for [path]. *)

  method get_file_for_uri : string -> App_info_cycle_64c425a0.file_t
  (** Gets a [GFile] for [uri].

      This operation never fails, but the returned object might not support any
      I/O operation if the URI is malformed or if the URI scheme is not
      supported. *)

  method get_supported_uri_schemes : unit -> string array
  (** Gets a list of URI schemes supported by [vfs]. *)

  method is_active : unit -> bool
  (** Checks if the VFS is active. *)

  method parse_name : string -> App_info_cycle_64c425a0.file_t
  (** This operation never fails, but the returned object might not support any
      I/O operations if the [parse_name] cannot be parsed by the [GVfs] module.
  *)

  method unregister_uri_scheme : string -> bool
  (** Unregisters the URI handler for [scheme] previously registered with
      g_vfs_register_uri_scheme(). *)

  method as_vfs : Raw.Vfs.t
end

class vfs : Raw.Vfs.t -> vfs_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Vfs.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GVfs], give one already wrapped. *)
