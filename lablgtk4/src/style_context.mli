(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StyleContext *)

type t = Gtk.Widget.t

(* Properties *)

external set_state : t -> Gtk_enums.stateflags -> unit = "ml_gtk_style_context_set_state"

external set_scale : t -> int -> unit = "ml_gtk_style_context_set_scale"

external set_display : t -> unit -> unit = "ml_gtk_style_context_set_display"

external save : t -> unit = "ml_gtk_style_context_save"

external restore : t -> unit = "ml_gtk_style_context_restore"

external remove_provider : t -> Gtk.Widget.t -> unit = "ml_gtk_style_context_remove_provider"

external remove_class : t -> string -> unit = "ml_gtk_style_context_remove_class"

external lookup_color : t -> string -> unit -> bool = "ml_gtk_style_context_lookup_color"

external has_class : t -> string -> bool = "ml_gtk_style_context_has_class"

external get_state : t -> Gtk_enums.stateflags = "ml_gtk_style_context_get_state"

external get_scale : t -> int = "ml_gtk_style_context_get_scale"

external get_padding : t -> Gtk.Widget.t -> unit = "ml_gtk_style_context_get_padding"

external get_margin : t -> Gtk.Widget.t -> unit = "ml_gtk_style_context_get_margin"

external get_color : t -> unit -> unit = "ml_gtk_style_context_get_color"

external get_border : t -> Gtk.Widget.t -> unit = "ml_gtk_style_context_get_border"

external add_provider : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_style_context_add_provider"

external add_class : t -> string -> unit = "ml_gtk_style_context_add_class"

