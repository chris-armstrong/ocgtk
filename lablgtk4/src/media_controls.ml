(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MediaControls *)

type t = [`media_controls | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new MediaControls *)
external new_ : Gtk.widget option -> t = "ml_gtk_media_controls_new"

(* Properties *)

(** Sets the stream that is controlled by @controls. *)
external set_media_stream : t -> Gtk.widget option -> unit = "ml_gtk_media_controls_set_media_stream"

(** Gets the media stream managed by @controls or %NULL if none. *)
external get_media_stream : t -> Gtk.widget = "ml_gtk_media_controls_get_media_stream"

