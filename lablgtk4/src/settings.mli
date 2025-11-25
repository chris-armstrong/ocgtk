(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Settings *)

type t = Gtk.widget

(* Properties *)

(** Undoes the effect of calling g_object_set() to install an
application-specific value for a setting.

After this call, the setting will again follow the session-wide
value for this setting. *)
external reset_property : t -> string -> unit = "ml_gtk_settings_reset_property"

