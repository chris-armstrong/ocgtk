(* GENERATED CODE - DO NOT EDIT *)
(* CssSection: CssSection *)

(** Defines a part of a CSS document.

    Because sections are nested into one another, you can use
    {{!Ocgtk.Raw.Css_section.val-get_parent}[CssSection.get_parent]} to get the
    containing region.

    The class built on this module is in {!Ocgtk.Css_section}. *)

type t = [ `css_section ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_css_section_get_type"

external new_ : Ocgio_raw.File.t option -> Css_location.t -> Css_location.t -> t
  = "ml_gtk_css_section_new"
(** Creates a new [GtkCssSection] referring to the section in the given [file]
    from the [start] location to the [end] location. *)

external new_with_bytes :
  Ocgio_raw.File.t option ->
  Glib_bytes.t option ->
  Css_location.t ->
  Css_location.t ->
  t = "ml_gtk_css_section_new_with_bytes"
(** Creates a new [GtkCssSection] referring to the section in the given [file]
    or the given [bytes] from the [start] location to the [end] location. *)

(* Methods *)

external to_string : t -> string = "ml_gtk_css_section_to_string"
(** Prints the section into a human-readable text form using
    [Gtk.CssSection.print]. *)

external ref : t -> t = "ml_gtk_css_section_ref"
(** Increments the reference count on [section]. *)

external get_start_location : t -> Css_location.t
  = "ml_gtk_css_section_get_start_location"
(** Returns the location in the CSS document where this section starts. *)

external get_parent : t -> t option = "ml_gtk_css_section_get_parent"
(** Gets the parent section for the given [section].

    The parent section is the section that contains this [section]. A special
    case are sections of type [GTK_CSS_SECTION_DOCUMENT]. Their parent will
    either be [None] if they are the original CSS document that was loaded by
    {{!Ocgtk.Raw.Css_provider.val-load_from_file}[Gtk.CssProvider.load_from_file]}
    or a section of type [GTK_CSS_SECTION_IMPORT] if it was loaded with an
    [@import] rule from a different file. *)

external get_file : t -> Ocgio_raw.File.t option = "ml_gtk_css_section_get_file"
(** Gets the file that [section] was parsed from.

    If no such file exists, for example because the CSS was loaded via
    {{!Ocgtk.Raw.Css_provider.val-load_from_data}[Gtk.CssProvider.load_from_data]},
    then [None] is returned. *)

external get_end_location : t -> Css_location.t
  = "ml_gtk_css_section_get_end_location"
(** Returns the location in the CSS document where this section ends. *)

external get_bytes : t -> Glib_bytes.t option = "ml_gtk_css_section_get_bytes"
(** Gets the bytes that [section] was parsed from. *)
