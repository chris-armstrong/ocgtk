(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CssProvider *)

type t = Gtk.Widget.t

(** Create a new CssProvider *)
external new_ : unit -> t = "ml_gtk_css_provider_new"

external load_named : t -> string -> string option -> unit = "ml_gtk_css_provider_load_named"

external load_from_string : t -> string -> unit = "ml_gtk_css_provider_load_from_string"

external load_from_resource : t -> string -> unit = "ml_gtk_css_provider_load_from_resource"

external load_from_path : t -> string -> unit = "ml_gtk_css_provider_load_from_path"

external load_from_file : t -> unit -> unit = "ml_gtk_css_provider_load_from_file"

external load_from_data : t -> string -> unit -> unit = "ml_gtk_css_provider_load_from_data"

external load_from_bytes : t -> unit -> unit = "ml_gtk_css_provider_load_from_bytes"

