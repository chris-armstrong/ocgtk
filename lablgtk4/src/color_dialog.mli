(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorDialog *)

type t = Gtk.Widget.t

(** Create a new ColorDialog *)
external new_ : unit -> t = "ml_gtk_color_dialog_new"

(* Properties *)

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_color_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_color_dialog_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_color_dialog_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_color_dialog_set_title"

(** Get property: with-alpha *)
external get_with_alpha : t -> bool = "ml_gtk_color_dialog_get_with_alpha"

(** Set property: with-alpha *)
external set_with_alpha : t -> bool -> unit = "ml_gtk_color_dialog_set_with_alpha"

external choose_rgba : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit -> unit = "ml_gtk_color_dialog_choose_rgba_bytecode" "ml_gtk_color_dialog_choose_rgba_native"

