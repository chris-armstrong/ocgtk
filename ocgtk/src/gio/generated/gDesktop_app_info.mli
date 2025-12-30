class desktop_app_info : Desktop_app_info.t ->
  object
    method get_action_name : string -> string
    method get_boolean : string -> bool
    method get_categories : unit -> string option
    method get_filename : unit -> string option
    method get_generic_name : unit -> string option
    method get_is_hidden : unit -> bool
    method get_locale_string : string -> string option
    method get_nodisplay : unit -> bool
    method get_show_in : string option -> bool
    method get_startup_wm_class : unit -> string option
    method get_string : string -> string option
    method has_key : string -> bool
    method launch_action : string -> #GApp_info_and__app_launch_context.app_launch_context option -> unit
    method as_desktop_app_info : Desktop_app_info.t
  end

