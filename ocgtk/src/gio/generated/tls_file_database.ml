(* GENERATED CODE - DO NOT EDIT *)
(* TlsFileDatabase: TlsFileDatabase *)

type t = [ `tls_file_database ] Gobject.obj
(** [GTlsFileDatabase] is implemented by [Gio.TlsDatabase] objects which load
    their certificate information from a file. It is an interface which TLS
    library specific subtypes implement. *)

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_tls_file_database_from_gobject"

(* Methods *)
(* Properties *)

external get_anchors : t -> string = "ml_g_tls_file_database_get_anchors"
(** Get property: anchors *)

external set_anchors : t -> string -> unit
  = "ml_g_tls_file_database_set_anchors"
(** Set property: anchors *)
