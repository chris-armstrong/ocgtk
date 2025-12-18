(* GENERATED CODE - DO NOT EDIT *)
(* CssProvider: CssProvider *)

type t = [`css_provider | `object_] Gobject.obj

(** Create a new CssProvider *)
external new_ : unit -> t = "ml_gtk_css_provider_new"

(** Loads a theme from the usual theme paths.

The actual process of finding the theme might change between
releases, but it is guaranteed that this function uses the same
mechanism to load the theme that GTK uses for loading its own theme. *)
external load_named : t -> string -> string option -> unit = "ml_gtk_css_provider_load_named"

(** Loads @string into @css_provider.

This clears any previously loaded information. *)
external load_from_string : t -> string -> unit = "ml_gtk_css_provider_load_from_string"

(** Loads the data contained in the resource at @resource_path into
the @css_provider.

This clears any previously loaded information. *)
external load_from_resource : t -> string -> unit = "ml_gtk_css_provider_load_from_resource"

(** Loads the data contained in @path into @css_provider.

This clears any previously loaded information. *)
external load_from_path : t -> string -> unit = "ml_gtk_css_provider_load_from_path"

