(* GENERATED CODE - DO NOT EDIT *)
(* SettingsBackend: SettingsBackend *)

type t = [`settings_backend | `object_] Gobject.obj

(* Methods *)
(** Signals that the writability of a single key has possibly changed.

Since GSettings performs no locking operations for itself, this call
will always be made in response to external events. *)
external writable_changed : t -> string -> unit = "ml_g_settings_backend_writable_changed"

(** Signals that the writability of all keys below a given path may have
changed.

Since GSettings performs no locking operations for itself, this call
will always be made in response to external events. *)
external path_writable_changed : t -> string -> unit = "ml_g_settings_backend_path_writable_changed"

