(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LockButton *)

type t = [`lock_button | `button | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new LockButton *)
external new_ : unit -> t = "ml_gtk_lock_button_new"

(* Properties *)

