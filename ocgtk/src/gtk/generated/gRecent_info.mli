class type recent_info_t = object
  method create_app_info :
    string option -> (Ocgtk_gio.Gio.App_info.app_info_t option, GError.t) result

  method exists : unit -> bool
  method get_age : unit -> int
  method get_description : unit -> string
  method get_display_name : unit -> string
  method get_gicon : unit -> Ocgtk_gio.Gio.Icon.icon_t option
  method get_mime_type : unit -> string
  method get_private_hint : unit -> bool
  method get_short_name : unit -> string
  method get_uri : unit -> string
  method get_uri_display : unit -> string option
  method has_application : string -> bool
  method has_group : string -> bool
  method is_local : unit -> bool
  method last_application : unit -> string
  method match_ : Recent_info.t -> bool
  method ref : unit -> Recent_info.t
  method as_recent_info : Recent_info.t
end

class recent_info : Recent_info.t -> recent_info_t
