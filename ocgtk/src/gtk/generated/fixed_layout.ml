(* GENERATED CODE - DO NOT EDIT *)
(* Layout manager: FixedLayout *)

type t = [`fixed_layout | `layout_manager | `object_] Gobject.obj

let as_layoutmanager (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t = Obj.magic obj

(** Create a new FixedLayout *)
external new_ : unit -> t = "ml_gtk_fixed_layout_new"

(* Methods *)
