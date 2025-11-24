(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Stack *)

type t = Gtk.Widget.t

(** Create a new Stack *)
external new_ : unit -> t = "ml_gtk_stack_new"

(* Properties *)

(** Get property: hhomogeneous *)
external get_hhomogeneous : t -> bool = "ml_gtk_stack_get_hhomogeneous"

(** Set property: hhomogeneous *)
external set_hhomogeneous : t -> bool -> unit = "ml_gtk_stack_set_hhomogeneous"

(** Get property: interpolate-size *)
external get_interpolate_size : t -> bool = "ml_gtk_stack_get_interpolate_size"

(** Set property: interpolate-size *)
external set_interpolate_size : t -> bool -> unit = "ml_gtk_stack_set_interpolate_size"

(** Get property: transition-duration *)
external get_transition_duration : t -> int = "ml_gtk_stack_get_transition_duration"

(** Set property: transition-duration *)
external set_transition_duration : t -> int -> unit = "ml_gtk_stack_set_transition_duration"

(** Get property: transition-running *)
external get_transition_running : t -> bool = "ml_gtk_stack_get_transition_running"

(** Get property: vhomogeneous *)
external get_vhomogeneous : t -> bool = "ml_gtk_stack_get_vhomogeneous"

(** Set property: vhomogeneous *)
external set_vhomogeneous : t -> bool -> unit = "ml_gtk_stack_set_vhomogeneous"

(** Get property: visible-child-name *)
external get_visible_child_name : t -> string = "ml_gtk_stack_get_visible_child_name"

(** Set property: visible-child-name *)
external set_visible_child_name : t -> string -> unit = "ml_gtk_stack_set_visible_child_name"

external set_visible_child_full : t -> string -> Gtk_enums.stacktransitiontype -> unit = "ml_gtk_stack_set_visible_child_full"

external set_visible_child : t -> Gtk.Widget.t -> unit = "ml_gtk_stack_set_visible_child"

external set_transition_type : t -> Gtk_enums.stacktransitiontype -> unit = "ml_gtk_stack_set_transition_type"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_stack_remove"

external get_visible_child : t -> Gtk.Widget.t = "ml_gtk_stack_get_visible_child"

external get_transition_type : t -> Gtk_enums.stacktransitiontype = "ml_gtk_stack_get_transition_type"

external get_pages : t -> Gtk.Widget.t = "ml_gtk_stack_get_pages"

external get_page : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_stack_get_page"

external get_child_by_name : t -> string -> Gtk.Widget.t = "ml_gtk_stack_get_child_by_name"

external add_titled : t -> Gtk.Widget.t -> string option -> string -> Gtk.Widget.t = "ml_gtk_stack_add_titled"

external add_named : t -> Gtk.Widget.t -> string option -> Gtk.Widget.t = "ml_gtk_stack_add_named"

external add_child : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_stack_add_child"

