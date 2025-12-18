(* GENERATED CODE - DO NOT EDIT *)
(* KeyvalTrigger: KeyvalTrigger *)

type t = [`keyval_trigger | `shortcut_trigger | `object_] Gobject.obj

(** Create a new KeyvalTrigger *)
external new_ : int -> Gdk.modifiertype -> t = "ml_gtk_keyval_trigger_new"

(* Properties *)

(** Get property: keyval *)
external get_keyval : t -> int = "ml_gtk_keyval_trigger_get_keyval"

(** Gets the modifiers that must be present to succeed
triggering @self. *)
external get_modifiers : t -> Gdk.modifiertype = "ml_gtk_keyval_trigger_get_modifiers"

