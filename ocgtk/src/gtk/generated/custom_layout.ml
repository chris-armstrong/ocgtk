(* GENERATED CODE - DO NOT EDIT *)
(* Layout manager: CustomLayout *)

type t = [`custom_layout | `layout_manager | `object_] Gobject.obj

let as_layoutmanager (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t = Obj.magic obj

(** Create a new CustomLayout *)
external new_ : unit -> unit -> unit -> t = "ml_gtk_custom_layout_new"

(* Methods *)
