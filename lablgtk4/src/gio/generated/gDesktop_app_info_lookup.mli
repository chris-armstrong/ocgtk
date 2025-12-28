class desktop_app_info_lookup : Desktop_app_info_lookup.t ->
  object
    method get_default_for_uri_scheme : string -> GApp_info_and__app_launch_context.app_info option
    method as_desktop_app_info_lookup : Desktop_app_info_lookup.t
  end

