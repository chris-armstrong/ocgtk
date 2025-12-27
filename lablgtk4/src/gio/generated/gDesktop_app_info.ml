(* High-level class for DesktopAppInfo *)
class desktop_app_info (obj : Desktop_app_info.t) = object (self)

  method get_action_name : string -> string =
    fun action_name ->
      (Desktop_app_info.get_action_name obj action_name)

  method get_boolean : string -> bool =
    fun key ->
      (Desktop_app_info.get_boolean obj key)

  method get_categories : unit -> string option =
    fun () ->
      (Desktop_app_info.get_categories obj)

  method get_filename : unit -> string option =
    fun () ->
      (Desktop_app_info.get_filename obj)

  method get_generic_name : unit -> string option =
    fun () ->
      (Desktop_app_info.get_generic_name obj)

  method get_is_hidden : unit -> bool =
    fun () ->
      (Desktop_app_info.get_is_hidden obj)

  method get_locale_string : string -> string option =
    fun key ->
      (Desktop_app_info.get_locale_string obj key)

  method get_nodisplay : unit -> bool =
    fun () ->
      (Desktop_app_info.get_nodisplay obj)

  method get_show_in : string option -> bool =
    fun desktop_env ->
      (Desktop_app_info.get_show_in obj desktop_env)

  method get_startup_wm_class : unit -> string option =
    fun () ->
      (Desktop_app_info.get_startup_wm_class obj)

  method get_string : string -> string option =
    fun key ->
      (Desktop_app_info.get_string obj key)

  method has_key : string -> bool =
    fun key ->
      (Desktop_app_info.has_key obj key)

  method launch_action : 'p1. string -> (#GApp_info_and__app_launch_context.app_launch_context as 'p1) option -> unit =
    fun action_name launch_context ->
      let launch_context = Option.map (fun (c) -> c#as_app_launch_context) launch_context in
      (Desktop_app_info.launch_action obj action_name launch_context)

    method as_desktop_app_info = obj
end

