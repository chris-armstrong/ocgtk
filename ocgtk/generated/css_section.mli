(** Defines a part of a CSS document.

    Because sections are nested into one another, you can use
    [CssSection.get_parent] to get the containing region.

    Its methods, signals and properties are on {!class-type-css_section_t}. The
    functions it is built on are in {!Ocgtk.Raw.Css_section}. *)

(** The methods, signals and properties of a [GtkCssSection]. *)
class type css_section_t = object
  method get_bytes : unit -> Glib_bytes.t option
  method get_end_location : unit -> Raw.Css_location.t
  method get_file : unit -> Ocgio.File.file_t option
  method get_parent : unit -> Raw.Css_section.t option
  method get_start_location : unit -> Raw.Css_location.t
  method ref : unit -> Raw.Css_section.t
  method to_string : unit -> string
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
