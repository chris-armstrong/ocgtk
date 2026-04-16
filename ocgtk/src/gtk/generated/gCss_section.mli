class type css_section_t = object
  method get_end_location : unit -> Css_location.t
  method get_file : unit -> Ocgtk_gio.Gio.File.file_t option
  method get_parent : unit -> Css_section.t option
  method get_start_location : unit -> Css_location.t
  method ref : unit -> Css_section.t
  method to_string : unit -> string
  method unref : unit -> unit
  method as_css_section : Css_section.t
end

class css_section : Css_section.t -> css_section_t

val new_ :
  Ocgtk_gio.Gio.File.file_t option ->
  Css_location.t ->
  Css_location.t ->
  css_section_t
