(* GENERATED CODE - DO NOT EDIT *)
(* AssistantPage: AssistantPage *)

type t = [`assistant_page | `object_] Gobject.obj

(* Properties *)

(** Get property: complete *)
external get_complete : t -> bool = "ml_gtk_assistant_page_get_complete"

(** Set property: complete *)
external set_complete : t -> bool -> unit = "ml_gtk_assistant_page_set_complete"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_assistant_page_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_assistant_page_set_title"

(** Returns the child to which @page belongs. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_assistant_page_get_child"

