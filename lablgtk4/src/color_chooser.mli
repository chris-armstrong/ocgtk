(* GENERATED CODE - DO NOT EDIT *)
(* ColorChooser: ColorChooser *)

type t = [`color_chooser] Gobject.obj

(* Properties *)

(** Sets whether or not the color chooser should use the alpha channel. *)
external set_use_alpha : t -> bool -> unit = "ml_gtk_color_chooser_set_use_alpha"

(** Returns whether the color chooser shows the alpha channel. *)
external get_use_alpha : t -> bool = "ml_gtk_color_chooser_get_use_alpha"

