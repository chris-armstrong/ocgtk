(** Defines a part of a CSS document.

    Because sections are nested into one another, you can use
    [CssSection.get_parent] to get the containing region.

    Its methods, signals and properties are on {!class-type-css_section_t}. The
    functions it is built on are in {!Ocgtk.Raw.Css_section}. *)

(** The methods, signals and properties of a [GtkCssSection]. *)
class type css_section_t = object
  method get_bytes : unit -> Glib_bytes.t option
  (** Gets the bytes that [section] was parsed from. *)

  method get_end_location : unit -> Raw.Css_location.t
  (** Returns the location in the CSS document where this section ends. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the file that [section] was parsed from.

      If no such file exists, for example because the CSS was loaded via
      [Gtk.CssProvider.load_from_data], then [NULL] is returned. *)

  method get_parent : unit -> Raw.Css_section.t option
  (** Gets the parent section for the given [section].

      The parent section is the section that contains this [section]. A special
      case are sections of type [GTK_CSS_SECTION_DOCUMENT]. Their parent will
      either be [NULL] if they are the original CSS document that was loaded by
      [Gtk.CssProvider.load_from_file] or a section of type
      [GTK_CSS_SECTION_IMPORT] if it was loaded with an [@import] rule from a
      different file. *)

  method get_start_location : unit -> Raw.Css_location.t
  (** Returns the location in the CSS document where this section starts. *)

  method ref : unit -> Raw.Css_section.t
  (** Increments the reference count on [section]. *)

  method to_string : unit -> string
  (** Prints the section into a human-readable text form using
      [Gtk.CssSection.print]. *)

  method as_css_section : Raw.Css_section.t
end

class css_section : Raw.Css_section.t -> css_section_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Css_section.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCssSection], give one already wrapped. *)

val new_ :
  Ocgio.File.file_t option ->
  Raw.Css_location.t ->
  Raw.Css_location.t ->
  css_section_t

val new_with_bytes :
  Ocgio.File.file_t option ->
  Glib_bytes.t option ->
  Raw.Css_location.t ->
  Raw.Css_location.t ->
  css_section_t
