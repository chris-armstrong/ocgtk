(* GENERATED CODE - DO NOT EDIT *)
(* SignalAction: SignalAction *)

(** Emits a signal on a widget.

    Signals that are used in this way are referred to as keybinding signals, and
    they are expected to be defined with the [G_SIGNAL_ACTION] flag. *)

type t = [ `signal_action | `shortcut_action | `object_ ] Gobject.obj

external new_ : string -> t = "ml_gtk_signal_action_new"
(** Create a new SignalAction *)

(* Methods *)

external get_signal_name : t -> string = "ml_gtk_signal_action_get_signal_name"
(** Returns the name of the signal that will be emitted. *)

(* Properties *)
