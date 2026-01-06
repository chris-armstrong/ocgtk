(* GENERATED CODE - DO NOT EDIT *)
(* CssSection: CssSection *)

(** Defines a part of a CSS document.

Because sections are nested into one another, you can use
[method@CssSection.get_parent] to get the containing region. *)
type t = [`css_section] Gobject.obj

(** Create a new CssSection *)
external new_ : unit -> Css_location.t -> Css_location.t -> t = "ml_gtk_css_section_new"

(* Methods *)
(** Decrements the reference count on `section`, freeing the
structure if the reference count reaches 0. *)
external unref : t -> unit = "ml_gtk_css_section_unref"

(** Prints the section into a human-readable text form using
[method@Gtk.CssSection.print]. *)
external to_string : t -> string = "ml_gtk_css_section_to_string"

(** Increments the reference count on `section`. *)
external ref : t -> t = "ml_gtk_css_section_ref"

(** Returns the location in the CSS document where this section starts. *)
external get_start_location : t -> Css_location.t = "ml_gtk_css_section_get_start_location"

(** Gets the parent section for the given `section`.

The parent section is the section that contains this `section`. A special
case are sections of  type `GTK_CSS_SECTION_DOCUMEN`T. Their parent will
either be `NULL` if they are the original CSS document that was loaded by
[method@Gtk.CssProvider.load_from_file] or a section of type
`GTK_CSS_SECTION_IMPORT` if it was loaded with an `@import` rule from
a different file. *)
external get_parent : t -> t option = "ml_gtk_css_section_get_parent"

(** Returns the location in the CSS document where this section ends. *)
external get_end_location : t -> Css_location.t = "ml_gtk_css_section_get_end_location"

