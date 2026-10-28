class type vfs_t = object
  (** {2:methods Methods} *)

  method get_file_for_path : string -> File.file_t
  (** Gets a [GFile] for [path]. *)

  method get_file_for_uri : string -> File.file_t
  (** Gets a [GFile] for [uri].

      This operation never fails, but the returned object might not support any
      I/O operation if the URI is malformed or if the URI scheme is not
      supported. *)

  method get_supported_uri_schemes : unit -> string array
  (** Gets a list of URI schemes supported by [vfs]. *)

  method is_active : unit -> bool
  (** Checks if the VFS is active. *)

  method parse_name : string -> File.file_t
  (** This operation never fails, but the returned object might not support any
      I/O operations if the [parse_name] cannot be parsed by the [GVfs] module.
  *)

  method unregister_uri_scheme : string -> bool
  (** Unregisters the URI handler for [scheme] previously registered with
      g_vfs_register_uri_scheme(). *)

  (** {2:conversions Conversions} *)

  method as_vfs : Raw.Vfs.t
end

(* High-level class for Vfs *)
class vfs (obj : Raw.Vfs.t) : vfs_t =
  object (self)
    method get_file_for_path : string -> File.file_t =
      fun path -> new File.file (Raw.Vfs.get_file_for_path obj path)

    method get_file_for_uri : string -> File.file_t =
      fun uri -> new File.file (Raw.Vfs.get_file_for_uri obj uri)

    method get_supported_uri_schemes : unit -> string array =
      fun () -> Raw.Vfs.get_supported_uri_schemes obj

    method is_active : unit -> bool = fun () -> Raw.Vfs.is_active obj

    method parse_name : string -> File.file_t =
      fun parse_name -> new File.file (Raw.Vfs.parse_name obj parse_name)

    method unregister_uri_scheme : string -> bool =
      fun scheme -> Raw.Vfs.unregister_uri_scheme obj scheme

    method as_vfs = obj
  end
