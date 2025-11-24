(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Overlay *)

type t = Gtk.widget

(** Create a new Overlay *)
external new_ : unit -> t = "ml_gtk_overlay_new"

(* Properties *)

external set_measure_overlay : t -> Gtk.widget -> bool -> unit = "ml_gtk_overlay_set_measure_overlay"

external set_clip_overlay : t -> Gtk.widget -> bool -> unit = "ml_gtk_overlay_set_clip_overlay"

external set_child : t -> Gtk.widget option -> unit = "ml_gtk_overlay_set_child"

external remove_overlay : t -> Gtk.widget -> unit = "ml_gtk_overlay_remove_overlay"

external get_measure_overlay : t -> Gtk.widget -> bool = "ml_gtk_overlay_get_measure_overlay"

external get_clip_overlay : t -> Gtk.widget -> bool = "ml_gtk_overlay_get_clip_overlay"

external get_child : t -> Gtk.widget = "ml_gtk_overlay_get_child"

external add_overlay : t -> Gtk.widget -> unit = "ml_gtk_overlay_add_overlay"

