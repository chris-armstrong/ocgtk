(* GENERATED CODE - DO NOT EDIT *)
(* UnixMountMonitor: UnixMountMonitor *)

type t = [`unix_mount_monitor | `object_] Gobject.obj

(** Create a new UnixMountMonitor *)
external new_ : unit -> t = "ml_g_unix_mount_monitor_new"

(* Methods *)
(** This function does nothing.

Before 2.44, this was a partially-effective way of controlling the
rate at which events would be reported under some uncommon
circumstances.  Since @mount_monitor is a singleton, it also meant
that calling this function would have side effects for other users of
the monitor. *)
external set_rate_limit : t -> int -> unit = "ml_g_unix_mount_monitor_set_rate_limit"

