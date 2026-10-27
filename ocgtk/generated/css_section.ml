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

(* High-level class for CssSection *)
class css_section (obj : Raw.Css_section.t) : css_section_t =
  object (self)
    method get_bytes : unit -> Glib_bytes.t option =
      fun () -> Raw.Css_section.get_bytes obj

    method get_end_location : unit -> Raw.Css_location.t =
      fun () -> Raw.Css_section.get_end_location obj

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.Css_section.get_file obj)

    method get_parent : unit -> Raw.Css_section.t option =
      fun () -> Raw.Css_section.get_parent obj

    method get_start_location : unit -> Raw.Css_location.t =
      fun () -> Raw.Css_section.get_start_location obj

    method ref : unit -> Raw.Css_section.t = fun () -> Raw.Css_section.ref obj
    method to_string : unit -> string = fun () -> Raw.Css_section.to_string obj
    method as_css_section = obj
  end

let new_ (file : Ocgio.File.file_t option) (start : Raw.Css_location.t)
    (end_ : Raw.Css_location.t) : css_section_t =
  let file = Option.map (fun c -> c#as_file) file in
  let obj_ = Raw.Css_section.new_ file start end_ in
  new css_section obj_

let new_with_bytes (file : Ocgio.File.file_t option)
    (bytes : Glib_bytes.t option) (start : Raw.Css_location.t)
    (end_ : Raw.Css_location.t) : css_section_t =
  let file = Option.map (fun c -> c#as_file) file in
  let obj_ = Raw.Css_section.new_with_bytes file bytes start end_ in
  new css_section obj_
