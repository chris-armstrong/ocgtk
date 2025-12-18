(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Button *)

type t = [`button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Button *)
external new_ : unit -> t = "ml_gtk_button_new"

(** Create a new Button *)
external new_from_icon_name : string -> t = "ml_gtk_button_new_from_icon_name"

(** Create a new Button *)
external new_with_label : string -> t = "ml_gtk_button_new_with_label"

(** Create a new Button *)
external new_with_mnemonic : string -> t = "ml_gtk_button_new_with_mnemonic"

(* Properties *)

(** Get property: can-shrink *)
external get_can_shrink : t -> bool = "ml_gtk_button_get_can_shrink"

(** Set property: can-shrink *)
external set_can_shrink : t -> bool -> unit = "ml_gtk_button_set_can_shrink"

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_button_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_button_set_has_frame"

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_button_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> string -> unit = "ml_gtk_button_set_icon_name"

(** Get property: label *)
external get_label : t -> string = "ml_gtk_button_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_button_set_label"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_button_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_button_set_use_underline"

(** Sets the child widget of @button.

Note that by using this API, you take full responsibility for setting
up the proper accessibility label and description information for @button.
Most likely, you'll either set the accessibility label or description
for @button explicitly, or you'll set a labelled-by or described-by
relations from @child to @button. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_button_set_child"

(** Gets the child widget of @button. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_button_get_child"

