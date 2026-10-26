class type css_provider_t = object
  inherit Style_provider.style_provider_t
  method load_from_bytes : Glib_bytes.t -> unit
  method load_from_data : string -> int -> unit
  method load_from_file : Ocgio.File.file_t -> unit
  method load_from_path : string -> unit
  method load_from_resource : string -> unit
  method load_from_string : string -> unit
  method load_named : string -> string option -> unit
  method to_string : unit -> string
  method prefers_color_scheme : Enums.interfacecolorscheme
  method set_prefers_color_scheme : Enums.interfacecolorscheme -> unit
  method prefers_contrast : Enums.interfacecontrast
  method set_prefers_contrast : Enums.interfacecontrast -> unit
  method as_css_provider : Raw.Css_provider.t
end

class css_provider : Raw.Css_provider.t -> css_provider_t

val new_ : unit -> css_provider_t
