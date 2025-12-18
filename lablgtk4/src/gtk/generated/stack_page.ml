(* GENERATED CODE - DO NOT EDIT *)
(* StackPage: StackPage *)

type t = [`stack_page | `object_] Gobject.obj

(* Properties *)

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_stack_page_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> string -> unit = "ml_gtk_stack_page_set_icon_name"

(** Get property: name *)
external get_name : t -> string = "ml_gtk_stack_page_get_name"

(** Set property: name *)
external set_name : t -> string -> unit = "ml_gtk_stack_page_set_name"

(** Get property: needs-attention *)
external get_needs_attention : t -> bool = "ml_gtk_stack_page_get_needs_attention"

(** Set property: needs-attention *)
external set_needs_attention : t -> bool -> unit = "ml_gtk_stack_page_set_needs_attention"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_stack_page_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_stack_page_set_title"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_stack_page_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_stack_page_set_use_underline"

(** Get property: visible *)
external get_visible : t -> bool = "ml_gtk_stack_page_get_visible"

(** Set property: visible *)
external set_visible : t -> bool -> unit = "ml_gtk_stack_page_set_visible"

(** Returns the stack child to which @self belongs. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_stack_page_get_child"

