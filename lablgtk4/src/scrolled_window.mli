(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ScrolledWindow *)

type t = Gtk.Widget.t

(** Create a new ScrolledWindow *)
external new_ : unit -> t = "ml_gtk_scrolled_window_new"

(* Properties *)

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_scrolled_window_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_scrolled_window_set_has_frame"

(** Get property: kinetic-scrolling *)
external get_kinetic_scrolling : t -> bool = "ml_gtk_scrolled_window_get_kinetic_scrolling"

(** Set property: kinetic-scrolling *)
external set_kinetic_scrolling : t -> bool -> unit = "ml_gtk_scrolled_window_set_kinetic_scrolling"

(** Get property: max-content-height *)
external get_max_content_height : t -> int = "ml_gtk_scrolled_window_get_max_content_height"

(** Set property: max-content-height *)
external set_max_content_height : t -> int -> unit = "ml_gtk_scrolled_window_set_max_content_height"

(** Get property: max-content-width *)
external get_max_content_width : t -> int = "ml_gtk_scrolled_window_get_max_content_width"

(** Set property: max-content-width *)
external set_max_content_width : t -> int -> unit = "ml_gtk_scrolled_window_set_max_content_width"

(** Get property: min-content-height *)
external get_min_content_height : t -> int = "ml_gtk_scrolled_window_get_min_content_height"

(** Set property: min-content-height *)
external set_min_content_height : t -> int -> unit = "ml_gtk_scrolled_window_set_min_content_height"

(** Get property: min-content-width *)
external get_min_content_width : t -> int = "ml_gtk_scrolled_window_get_min_content_width"

(** Set property: min-content-width *)
external set_min_content_width : t -> int -> unit = "ml_gtk_scrolled_window_set_min_content_width"

(** Get property: overlay-scrolling *)
external get_overlay_scrolling : t -> bool = "ml_gtk_scrolled_window_get_overlay_scrolling"

(** Set property: overlay-scrolling *)
external set_overlay_scrolling : t -> bool -> unit = "ml_gtk_scrolled_window_set_overlay_scrolling"

(** Get property: propagate-natural-height *)
external get_propagate_natural_height : t -> bool = "ml_gtk_scrolled_window_get_propagate_natural_height"

(** Set property: propagate-natural-height *)
external set_propagate_natural_height : t -> bool -> unit = "ml_gtk_scrolled_window_set_propagate_natural_height"

(** Get property: propagate-natural-width *)
external get_propagate_natural_width : t -> bool = "ml_gtk_scrolled_window_get_propagate_natural_width"

(** Set property: propagate-natural-width *)
external set_propagate_natural_width : t -> bool -> unit = "ml_gtk_scrolled_window_set_propagate_natural_width"

external unset_placement : t -> unit = "ml_gtk_scrolled_window_unset_placement"

external set_vadjustment : t -> Gtk.Widget.t option -> unit = "ml_gtk_scrolled_window_set_vadjustment"

external set_policy : t -> Gtk_enums.policytype -> Gtk_enums.policytype -> unit = "ml_gtk_scrolled_window_set_policy"

external set_placement : t -> Gtk_enums.cornertype -> unit = "ml_gtk_scrolled_window_set_placement"

external set_hadjustment : t -> Gtk.Widget.t option -> unit = "ml_gtk_scrolled_window_set_hadjustment"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_scrolled_window_set_child"

external get_vscrollbar : t -> Gtk.Widget.t = "ml_gtk_scrolled_window_get_vscrollbar"

external get_vadjustment : t -> Gtk.Widget.t = "ml_gtk_scrolled_window_get_vadjustment"

external get_policy : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_scrolled_window_get_policy"

external get_placement : t -> Gtk_enums.cornertype = "ml_gtk_scrolled_window_get_placement"

external get_hscrollbar : t -> Gtk.Widget.t = "ml_gtk_scrolled_window_get_hscrollbar"

external get_hadjustment : t -> Gtk.Widget.t = "ml_gtk_scrolled_window_get_hadjustment"

external get_child : t -> Gtk.Widget.t = "ml_gtk_scrolled_window_get_child"

