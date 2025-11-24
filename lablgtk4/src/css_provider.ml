(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CssProvider *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_css_provider_new"

external load_named : t -> string -> string option -> unit = "ml_gtk_css_provider_load_named"

external load_from_string : t -> string -> unit = "ml_gtk_css_provider_load_from_string"

external load_from_resource : t -> string -> unit = "ml_gtk_css_provider_load_from_resource"

external load_from_path : t -> string -> unit = "ml_gtk_css_provider_load_from_path"

