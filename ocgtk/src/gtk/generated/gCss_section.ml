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

(* High-level class for CssSection *)
class css_section (obj : Css_section.t) : css_section_t = object (self)

  method get_end_location : unit -> Css_location.t =
    fun () ->
      (Css_section.get_end_location obj)

  method get_file : unit -> Ocgtk_gio.Gio.File.file_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.File.file ret) (Css_section.get_file obj)

  method get_parent : unit -> Css_section.t option =
    fun () ->
      (Css_section.get_parent obj)

  method get_start_location : unit -> Css_location.t =
    fun () ->
      (Css_section.get_start_location obj)

  method ref : unit -> Css_section.t =
    fun () ->
      (Css_section.ref obj)

  method to_string : unit -> string =
    fun () ->
      (Css_section.to_string obj)

  method unref : unit -> unit =
    fun () ->
      (Css_section.unref obj)

    method as_css_section = obj
end

let new_ (file : Ocgtk_gio.Gio.File.file_t option) (start : Css_location.t) (end_ : Css_location.t) : css_section_t =
  let file = Option.map (fun c -> c#as_file) file in
  new css_section (Css_section.new_ file start end_)

