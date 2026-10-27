(** [GTlsFileDatabase] is implemented by [Gio.TlsDatabase] objects which load
    their certificate information from a file. It is an interface which TLS
    library specific subtypes implement.

    Its methods, signals and properties are on
    {!class-type-tls_file_database_t}. The functions it is built on are in
    {!Ocgio.Raw.Tls_file_database}. *)

(** The methods, signals and properties of a [GTlsFileDatabase]. *)
class type tls_file_database_t = object
  method anchors : string
  method set_anchors : string -> unit
  method as_tls_file_database : Raw.Tls_file_database.t
end

class tls_file_database : Raw.Tls_file_database.t -> tls_file_database_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_file_database.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GTlsFileDatabase], give one already wrapped. *)
