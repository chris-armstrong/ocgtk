(* GENERATED CODE - DO NOT EDIT *)
(* NativeSocketAddress: NativeSocketAddress *)

(** A socket address of some unknown native type.

    This corresponds to a general [struct sockaddr] of a type not otherwise
    handled by GLib.

    The class built on this module is in {!Ocgio.Native_socket_address}. *)

type t = [ `native_socket_address | `socket_address | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_native_socket_address_get_type"

(* Methods *)
