(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LockButton *)

type t = [`lock_button | `button | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new LockButton *)
external new_ : unit -> t = "ml_gtk_lock_button_new"

(* Properties *)

