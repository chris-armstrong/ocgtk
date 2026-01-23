class app_info : App_info_and__app_launch_context.App_info.t ->
  object
    method add_supports_type : string -> (bool, GError.t) result
    method can_delete : unit -> bool
    method can_remove_supports_type : unit -> bool
    method delete : unit -> bool
    method dup : unit -> app_info
    method get_commandline : unit -> string option
    method get_description : unit -> string option
    method get_display_name : unit -> string
    method get_executable : unit -> string
    method get_icon : unit -> GIcon.icon option
    method get_id : unit -> string option
    method get_name : unit -> string
    method get_supported_types : unit -> string array
    method remove_supports_type : string -> (bool, GError.t) result
    method set_as_default_for_extension : string -> (bool, GError.t) result
    method set_as_default_for_type : string -> (bool, GError.t) result
    method set_as_last_used_for_type : string -> (bool, GError.t) result
    method should_show : unit -> bool
    method supports_files : unit -> bool
    method supports_uris : unit -> bool
    method as_app_info : App_info_and__app_launch_context.App_info.t
  end

and app_launch_context : App_info_and__app_launch_context.App_launch_context.t ->
  object
    inherit Gapp_launch_context_signals.app_launch_context_signals
    method launch_failed : string -> unit
    method setenv : string -> string -> unit
    method unsetenv : string -> unit
    method as_app_launch_context : App_info_and__app_launch_context.App_launch_context.t
  end
