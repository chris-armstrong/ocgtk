(** Entry point for using GIO functionality.

    Its methods, signals and properties are on {!class-type-vfs_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.Vfs}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Vfs].}

    Inherits from: [GObject.Object]

    Entry point for using GIO functionality. *)
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

class vfs : Raw.Vfs.t -> vfs_t
(** Wraps a raw handle of {!Ocgio.Raw.Vfs.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
