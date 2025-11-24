(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Button *)

type t = Gtk.widget

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

external set_child : t -> Gtk.widget option -> unit = "ml_gtk_button_set_child"

external get_child : t -> Gtk.widget = "ml_gtk_button_get_child"

