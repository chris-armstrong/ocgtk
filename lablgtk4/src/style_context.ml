(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StyleContext *)

type t = Gtk.widget

(* Properties *)

external set_state : t -> Gtk_enums.stateflags -> unit = "ml_gtk_style_context_set_state"

external set_scale : t -> int -> unit = "ml_gtk_style_context_set_scale"

external save : t -> unit = "ml_gtk_style_context_save"

external restore : t -> unit = "ml_gtk_style_context_restore"

external remove_provider : t -> Gtk.widget -> unit = "ml_gtk_style_context_remove_provider"

external remove_class : t -> string -> unit = "ml_gtk_style_context_remove_class"

external has_class : t -> string -> bool = "ml_gtk_style_context_has_class"

external get_state : t -> Gtk_enums.stateflags = "ml_gtk_style_context_get_state"

external get_scale : t -> int = "ml_gtk_style_context_get_scale"

external get_padding : t -> Gtk.widget -> unit = "ml_gtk_style_context_get_padding"

external get_margin : t -> Gtk.widget -> unit = "ml_gtk_style_context_get_margin"

external get_border : t -> Gtk.widget -> unit = "ml_gtk_style_context_get_border"

external add_provider : t -> Gtk.widget -> int -> unit = "ml_gtk_style_context_add_provider"

external add_class : t -> string -> unit = "ml_gtk_style_context_add_class"

