(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Accessible *)

type t = Gtk.widget

(* Properties *)

external update_next_accessible_sibling : t -> Gtk.widget option -> unit = "ml_gtk_accessible_update_next_accessible_sibling"

external set_accessible_parent : t -> Gtk.widget option -> Gtk.widget option -> unit = "ml_gtk_accessible_set_accessible_parent"

external reset_state : t -> Gtk_enums.accessiblestate -> unit = "ml_gtk_accessible_reset_state"

external reset_relation : t -> Gtk_enums.accessiblerelation -> unit = "ml_gtk_accessible_reset_relation"

external reset_property : t -> Gtk_enums.accessibleproperty -> unit = "ml_gtk_accessible_reset_property"

external get_platform_state : t -> Gtk_enums.accessibleplatformstate -> bool = "ml_gtk_accessible_get_platform_state"

external get_next_accessible_sibling : t -> Gtk.widget = "ml_gtk_accessible_get_next_accessible_sibling"

external get_first_accessible_child : t -> Gtk.widget = "ml_gtk_accessible_get_first_accessible_child"

external get_at_context : t -> Gtk.widget = "ml_gtk_accessible_get_at_context"

external get_accessible_role : t -> Gtk_enums.accessiblerole = "ml_gtk_accessible_get_accessible_role"

external get_accessible_parent : t -> Gtk.widget = "ml_gtk_accessible_get_accessible_parent"

external announce : t -> string -> Gtk_enums.accessibleannouncementpriority -> unit = "ml_gtk_accessible_announce"

