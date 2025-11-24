(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Popover *)

type t = Gtk.Widget.t

(** Create a new Popover *)
external new_ : unit -> t = "ml_gtk_popover_new"

(* Properties *)

(** Get property: autohide *)
external get_autohide : t -> bool = "ml_gtk_popover_get_autohide"

(** Set property: autohide *)
external set_autohide : t -> bool -> unit = "ml_gtk_popover_set_autohide"

(** Get property: cascade-popdown *)
external get_cascade_popdown : t -> bool = "ml_gtk_popover_get_cascade_popdown"

(** Set property: cascade-popdown *)
external set_cascade_popdown : t -> bool -> unit = "ml_gtk_popover_set_cascade_popdown"

(** Get property: has-arrow *)
external get_has_arrow : t -> bool = "ml_gtk_popover_get_has_arrow"

(** Set property: has-arrow *)
external set_has_arrow : t -> bool -> unit = "ml_gtk_popover_set_has_arrow"

(** Get property: mnemonics-visible *)
external get_mnemonics_visible : t -> bool = "ml_gtk_popover_get_mnemonics_visible"

(** Set property: mnemonics-visible *)
external set_mnemonics_visible : t -> bool -> unit = "ml_gtk_popover_set_mnemonics_visible"

external set_position : t -> Gtk_enums.positiontype -> unit = "ml_gtk_popover_set_position"

external set_offset : t -> int -> int -> unit = "ml_gtk_popover_set_offset"

external set_default_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_popover_set_default_widget"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_popover_set_child"

external present : t -> unit = "ml_gtk_popover_present"

external popup : t -> unit = "ml_gtk_popover_popup"

external popdown : t -> unit = "ml_gtk_popover_popdown"

external get_position : t -> Gtk_enums.positiontype = "ml_gtk_popover_get_position"

external get_child : t -> Gtk.Widget.t = "ml_gtk_popover_get_child"

