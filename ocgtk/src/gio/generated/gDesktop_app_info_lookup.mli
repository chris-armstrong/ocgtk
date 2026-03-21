class type desktop_app_info_lookup_t = object
    method get_default_for_uri_scheme : string -> GApp_info_and__app_launch_context.app_info_t option
    method as_desktop_app_info_lookup : Desktop_app_info_lookup.t
end

class desktop_app_info_lookup : Desktop_app_info_lookup.t -> desktop_app_info_lookup_t

