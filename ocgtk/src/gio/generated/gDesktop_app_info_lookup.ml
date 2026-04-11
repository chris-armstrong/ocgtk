class type desktop_app_info_lookup_t = object
    method get_default_for_uri_scheme : string -> GApp_info_and__app_launch_context.app_info_t option
    method as_desktop_app_info_lookup : Desktop_app_info_lookup.t
end

(* High-level class for DesktopAppInfoLookup *)
class desktop_app_info_lookup (obj : Desktop_app_info_lookup.t) : desktop_app_info_lookup_t = object (self)

  method get_default_for_uri_scheme : string -> GApp_info_and__app_launch_context.app_info_t option =
    fun uri_scheme ->
      Option.map (fun ret -> new GApp_info_and__app_launch_context.app_info ret) (Desktop_app_info_lookup.get_default_for_uri_scheme obj uri_scheme)

    method as_desktop_app_info_lookup = obj
end

