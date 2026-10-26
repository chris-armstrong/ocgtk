class type css_provider_t = object
  inherit GStyle_provider.style_provider_t
  method load_from_bytes : Glib_bytes.t -> unit
  method load_from_data : string -> int -> unit
  method load_from_file : Ocgtk_gio.Gio.File.file_t -> unit
  method load_from_path : string -> unit
  method load_from_resource : string -> unit
  method load_from_string : string -> unit
  method load_named : string -> string option -> unit
  method to_string : unit -> string
  method prefers_color_scheme : Gtk_enums.interfacecolorscheme
  method set_prefers_color_scheme : Gtk_enums.interfacecolorscheme -> unit
  method prefers_contrast : Gtk_enums.interfacecontrast
  method set_prefers_contrast : Gtk_enums.interfacecontrast -> unit
  method as_css_provider : Css_provider.t
end

(* High-level class for CssProvider *)
class css_provider (obj : Css_provider.t) : css_provider_t =
  object (self)
    inherit GStyle_provider.style_provider (Style_provider.from_gobject obj)

    method load_from_bytes : Glib_bytes.t -> unit =
      fun data -> Css_provider.load_from_bytes obj data

    method load_from_data : string -> int -> unit =
      fun data length -> Css_provider.load_from_data obj data length

    method load_from_file : Ocgtk_gio.Gio.File.file_t -> unit =
      fun file ->
        let file = file#as_file in
        Css_provider.load_from_file obj file

    method load_from_path : string -> unit =
      fun path -> Css_provider.load_from_path obj path

    method load_from_resource : string -> unit =
      fun resource_path -> Css_provider.load_from_resource obj resource_path

    method load_from_string : string -> unit =
      fun string -> Css_provider.load_from_string obj string

    method load_named : string -> string option -> unit =
      fun name variant -> Css_provider.load_named obj name variant

    method to_string : unit -> string = fun () -> Css_provider.to_string obj
    method prefers_color_scheme = Css_provider.get_prefers_color_scheme obj

    method set_prefers_color_scheme v =
      Css_provider.set_prefers_color_scheme obj v

    method prefers_contrast = Css_provider.get_prefers_contrast obj
    method set_prefers_contrast v = Css_provider.set_prefers_contrast obj v
    method as_css_provider = obj
  end

let new_ () : css_provider_t = new css_provider (Css_provider.new_ ())
