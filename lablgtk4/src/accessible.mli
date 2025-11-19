(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Accessible *)

type t = Gtk.Widget.t

(* Properties *)

external update_state_value : t -> int -> unit -> unit -> unit = "ml_gtk_accessible_update_state_value"

external update_state : t -> accessiblestate -> unit -> unit = "ml_gtk_accessible_update_state"

external update_relation_value : t -> int -> unit -> unit -> unit = "ml_gtk_accessible_update_relation_value"

external update_relation : t -> accessiblerelation -> unit -> unit = "ml_gtk_accessible_update_relation"

external update_property_value : t -> int -> unit -> unit -> unit = "ml_gtk_accessible_update_property_value"

external update_property : t -> accessibleproperty -> unit -> unit = "ml_gtk_accessible_update_property"

external update_next_accessible_sibling : t -> Gtk.Widget.t option -> unit = "ml_gtk_accessible_update_next_accessible_sibling"

external set_accessible_parent : t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit = "ml_gtk_accessible_set_accessible_parent"

external reset_state : t -> accessiblestate -> unit = "ml_gtk_accessible_reset_state"

external reset_relation : t -> accessiblerelation -> unit = "ml_gtk_accessible_reset_relation"

external reset_property : t -> accessibleproperty -> unit = "ml_gtk_accessible_reset_property"

external get_platform_state : t -> accessibleplatformstate -> bool = "ml_gtk_accessible_get_platform_state"

external get_next_accessible_sibling : t -> Gtk.Widget.t = "ml_gtk_accessible_get_next_accessible_sibling"

external get_first_accessible_child : t -> Gtk.Widget.t = "ml_gtk_accessible_get_first_accessible_child"

external get_bounds : t -> int -> int -> int -> int -> bool = "ml_gtk_accessible_get_bounds"

external get_at_context : t -> Gtk.Widget.t = "ml_gtk_accessible_get_at_context"

external get_accessible_role : t -> accessiblerole = "ml_gtk_accessible_get_accessible_role"

external get_accessible_parent : t -> Gtk.Widget.t = "ml_gtk_accessible_get_accessible_parent"

external announce : t -> string -> accessibleannouncementpriority -> unit = "ml_gtk_accessible_announce"

