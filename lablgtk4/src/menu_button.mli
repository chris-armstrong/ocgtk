(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MenuButton *)

type t = Gtk.Widget.t

(** Create a new MenuButton *)
external new_ : unit -> t = "ml_gtk_menu_button_new"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_menu_button_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_menu_button_set_active"

(** Get property: always-show-arrow *)
external get_always_show_arrow : t -> bool = "ml_gtk_menu_button_get_always_show_arrow"

(** Set property: always-show-arrow *)
external set_always_show_arrow : t -> bool -> unit = "ml_gtk_menu_button_set_always_show_arrow"

(** Get property: can-shrink *)
external get_can_shrink : t -> bool = "ml_gtk_menu_button_get_can_shrink"

(** Set property: can-shrink *)
external set_can_shrink : t -> bool -> unit = "ml_gtk_menu_button_set_can_shrink"

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_menu_button_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_menu_button_set_has_frame"

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_menu_button_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> string -> unit = "ml_gtk_menu_button_set_icon_name"

(** Get property: label *)
external get_label : t -> string = "ml_gtk_menu_button_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_menu_button_set_label"

(** Get property: primary *)
external get_primary : t -> bool = "ml_gtk_menu_button_get_primary"

(** Set property: primary *)
external set_primary : t -> bool -> unit = "ml_gtk_menu_button_set_primary"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_menu_button_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_menu_button_set_use_underline"

external set_popover : t -> Gtk.Widget.t option -> unit = "ml_gtk_menu_button_set_popover"

external set_direction : t -> Gtk_enums.arrowtype -> unit = "ml_gtk_menu_button_set_direction"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_menu_button_set_child"

external popup : t -> unit = "ml_gtk_menu_button_popup"

external popdown : t -> unit = "ml_gtk_menu_button_popdown"

external get_popover : t -> Gtk.Widget.t = "ml_gtk_menu_button_get_popover"

external get_direction : t -> Gtk_enums.arrowtype = "ml_gtk_menu_button_get_direction"

external get_child : t -> Gtk.Widget.t = "ml_gtk_menu_button_get_child"

