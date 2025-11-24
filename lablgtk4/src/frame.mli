(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Frame *)

type t = Gtk.Widget.t

(** Create a new Frame *)
external new_ : string option -> t = "ml_gtk_frame_new"

(* Properties *)

(** Get property: label *)
external get_label : t -> string = "ml_gtk_frame_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_frame_set_label"

(** Get property: label-xalign *)
external get_label_xalign : t -> float = "ml_gtk_frame_get_label_xalign"

(** Set property: label-xalign *)
external set_label_xalign : t -> float -> unit = "ml_gtk_frame_set_label_xalign"

external set_label_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_frame_set_label_widget"

external set_label_align : t -> float -> unit = "ml_gtk_frame_set_label_align"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_frame_set_child"

external get_label_widget : t -> Gtk.Widget.t = "ml_gtk_frame_get_label_widget"

external get_label_align : t -> float = "ml_gtk_frame_get_label_align"

external get_child : t -> Gtk.Widget.t = "ml_gtk_frame_get_child"

