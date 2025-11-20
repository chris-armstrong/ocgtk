(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorChooser *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: use-alpha *)
external get_use_alpha : t -> bool = "ml_gtk_color_chooser_get_use_alpha"

(** Set property: use-alpha *)
external set_use_alpha : t -> bool -> unit = "ml_gtk_color_chooser_set_use_alpha"

external set_rgba : t -> unit -> unit = "ml_gtk_color_chooser_set_rgba"

external get_rgba : t -> unit -> unit = "ml_gtk_color_chooser_get_rgba"

external add_palette : t -> Gtk_enums.orientation -> int -> int -> unit -> unit = "ml_gtk_color_chooser_add_palette"

