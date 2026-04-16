class type desktop_app_info_t = object
  inherit
    GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .app_info_t

  method get_action_name : string -> string
  method get_boolean : string -> bool
  method get_categories : unit -> string option
  method get_filename : unit -> string option
  method get_generic_name : unit -> string option
  method get_is_hidden : unit -> bool
  method get_keywords : unit -> string array
  method get_locale_string : string -> string option
  method get_nodisplay : unit -> bool
  method get_show_in : string option -> bool
  method get_startup_wm_class : unit -> string option
  method get_string : string -> string option
  method has_key : string -> bool

  method launch_action :
    string ->
    GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume
    .app_launch_context_t
    option ->
    unit

  method list_actions : unit -> string array
  method as_desktop_app_info : Desktop_app_info.t
end

class desktop_app_info : Desktop_app_info.t -> desktop_app_info_t

val new_ : string -> desktop_app_info_t
val new_from_filename : string -> desktop_app_info_t
