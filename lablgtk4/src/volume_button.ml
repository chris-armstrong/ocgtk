(* GENERATED CODE - DO NOT EDIT *)
(* Widget: VolumeButton *)

type t = [`volume_button | `scale_button | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new VolumeButton *)
external new_ : unit -> t = "ml_gtk_volume_button_new"

(* Properties *)

