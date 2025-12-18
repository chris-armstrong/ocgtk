(* GError - Error handling for GTK/GLib *)

(** GError record type representing errors from GTK/GLib functions *)
type t = {
  domain : int;     (** Error domain (GQuark) *)
  code : int;       (** Error code within the domain *)
  message : string; (** Human-readable error message *)
}
