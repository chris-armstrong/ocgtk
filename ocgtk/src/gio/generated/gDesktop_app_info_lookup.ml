(* High-level class for DesktopAppInfoLookup *)
class desktop_app_info_lookup (obj : Desktop_app_info_lookup.t) = object (self)

  method get_default_for_uri_scheme : string -> GApp_info_and__app_launch_context.app_info option =
    fun uri_scheme ->
      Option.map (fun ret -> new GApp_info_and__app_launch_context.app_info ret) (Desktop_app_info_lookup.get_default_for_uri_scheme obj uri_scheme)

    method as_desktop_app_info_lookup = obj
end

