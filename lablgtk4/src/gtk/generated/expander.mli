(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Expander *)

type t = [`expander | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Expander *)
external new_ : string option -> t = "ml_gtk_expander_new"

(** Create a new Expander *)
external new_with_mnemonic : string option -> t = "ml_gtk_expander_new_with_mnemonic"

(* Properties *)

(** Get property: expanded *)
external get_expanded : t -> bool = "ml_gtk_expander_get_expanded"

(** Set property: expanded *)
external set_expanded : t -> bool -> unit = "ml_gtk_expander_set_expanded"

(** Get property: label *)
external get_label : t -> string = "ml_gtk_expander_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_expander_set_label"

(** Get property: resize-toplevel *)
external get_resize_toplevel : t -> bool = "ml_gtk_expander_get_resize_toplevel"

(** Set property: resize-toplevel *)
external set_resize_toplevel : t -> bool -> unit = "ml_gtk_expander_set_resize_toplevel"

(** Get property: use-markup *)
external get_use_markup : t -> bool = "ml_gtk_expander_get_use_markup"

(** Set property: use-markup *)
external set_use_markup : t -> bool -> unit = "ml_gtk_expander_set_use_markup"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_expander_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_expander_set_use_underline"

(** Set the label widget for the expander.

This is the widget that will appear embedded alongside
the expander arrow. *)
external set_label_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_expander_set_label_widget"

(** Sets the child widget of @expander. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_expander_set_child"

(** Retrieves the label widget for the frame. *)
external get_label_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_expander_get_label_widget"

(** Gets the child widget of @expander. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_expander_get_child"

