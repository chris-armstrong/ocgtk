(* GENERATED CODE - DO NOT EDIT *)
(* KeyvalTrigger: KeyvalTrigger *)

type t = [`keyval_trigger | `shortcut_trigger | `object_] Gobject.obj

(** Create a new KeyvalTrigger *)
external new_ : int -> unit -> t = "ml_gtk_keyval_trigger_new"

(* Methods *)
(** Gets the keyval that must be pressed to succeed
triggering @self. *)
external get_keyval : t -> int = "ml_gtk_keyval_trigger_get_keyval"

(* Properties *)

