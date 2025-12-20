(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerScroll *)

type t = [`event_controller_scroll | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(** Create a new EventControllerScroll *)
external new_ : unit -> t = "ml_gtk_event_controller_scroll_new"

(* Methods *)
(* Properties *)

