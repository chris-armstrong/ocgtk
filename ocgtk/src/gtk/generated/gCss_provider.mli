class type css_provider_t = object
    inherit Gcss_provider_signals.css_provider_signals
    method load_from_file : Ocgtk_gio.Gio.file_t -> unit
    method load_from_path : string -> unit
    method load_from_resource : string -> unit
    method load_from_string : string -> unit
    method load_named : string -> string option -> unit
    method to_string : unit -> string
    method as_css_provider : Css_provider.t
end

class css_provider : Css_provider.t -> css_provider_t

