(* GENERATED CODE - DO NOT EDIT *)
(* TlsFileDatabase: TlsFileDatabase *)

(** [GTlsFileDatabase] is implemented by [Gio.TlsDatabase] objects which load
    their certificate information from a file. It is an interface which TLS
    library specific subtypes implement.

    The class built on this module is in {!Ocgio.Tls_file_database}. *)

type t = [ `tls_file_database ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_tls_file_database_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_tls_file_database_from_gobject"

(* Methods *)
(* Properties *)

external get_anchors : t -> string = "ml_g_tls_file_database_get_anchors"
(** The path to a file containing PEM encoded certificate authority root
    anchors. The certificates in this file will be treated as root authorities
    for the purpose of verifying other certificates via the
    g_tls_database_verify_chain() operation. *)

external set_anchors : t -> string -> unit
  = "ml_g_tls_file_database_set_anchors"
(** The path to a file containing PEM encoded certificate authority root
    anchors. The certificates in this file will be treated as root authorities
    for the purpose of verifying other certificates via the
    g_tls_database_verify_chain() operation. *)
