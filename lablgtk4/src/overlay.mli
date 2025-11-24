(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Overlay *)

type t = Gtk.Widget.t

(** Create a new Overlay *)
external new_ : unit -> t = "ml_gtk_overlay_new"

(* Properties *)

external set_measure_overlay : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_overlay_set_measure_overlay"

external set_clip_overlay : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_overlay_set_clip_overlay"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_overlay_set_child"

external remove_overlay : t -> Gtk.Widget.t -> unit = "ml_gtk_overlay_remove_overlay"

external get_measure_overlay : t -> Gtk.Widget.t -> bool = "ml_gtk_overlay_get_measure_overlay"

external get_clip_overlay : t -> Gtk.Widget.t -> bool = "ml_gtk_overlay_get_clip_overlay"

external get_child : t -> Gtk.Widget.t = "ml_gtk_overlay_get_child"

external add_overlay : t -> Gtk.Widget.t -> unit = "ml_gtk_overlay_add_overlay"

