(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: DragSource *)

type t = [`drag_source | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(** Create a new DragSource *)
external new_ : unit -> t = "ml_gtk_drag_source_new"

(* Methods *)
(** Cancels a currently ongoing drag operation. *)
external drag_cancel : t -> unit = "ml_gtk_drag_source_drag_cancel"

(* Properties *)

