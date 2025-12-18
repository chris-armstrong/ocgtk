(* GENERATED CODE - DO NOT EDIT *)
(* SignalAction: SignalAction *)

type t = [`signal_action | `shortcut_action | `object_] Gobject.obj

(** Create a new SignalAction *)
external new_ : string -> t = "ml_gtk_signal_action_new"

(* Properties *)

(** Get property: signal-name *)
external get_signal_name : t -> string = "ml_gtk_signal_action_get_signal_name"

