(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type app_info_t = object
    method add_supports_type : string -> (bool, GError.t) result
    method can_delete : unit -> bool
    method can_remove_supports_type : unit -> bool
    method delete : unit -> bool
    method dup : unit -> app_info_t
    method get_commandline : unit -> string option
    method get_description : unit -> string option
    method get_display_name : unit -> string
    method get_executable : unit -> string
    method get_icon : unit -> GIcon.icon_t option
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

and app_launch_context_t = object
    inherit Gapp_launch_context_signals.app_launch_context_signals
    method launch_failed : string -> unit
    method setenv : string -> string -> unit
    method unsetenv : string -> unit
    method as_app_launch_context : App_info_and__app_launch_context.App_launch_context.t
end


class app_info (obj : App_info_and__app_launch_context.App_info.t) : app_info_t = object (self)

  method add_supports_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context.App_info.add_supports_type obj content_type)

  method can_delete : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context.App_info.can_delete obj)

  method can_remove_supports_type : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context.App_info.can_remove_supports_type obj)

  method delete : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context.App_info.delete obj)

  method dup : unit -> app_info_t =
    fun () ->
      new  app_info(App_info_and__app_launch_context.App_info.dup obj)

  method get_commandline : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_commandline obj)

  method get_description : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_description obj)

  method get_display_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_display_name obj)

  method get_executable : unit -> string =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_executable obj)

  method get_icon : unit -> GIcon.icon_t option =
    fun () ->
      Option.map (fun ret -> new GIcon.icon ret) (App_info_and__app_launch_context.App_info.get_icon obj)

  method get_id : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_id obj)

  method get_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_name obj)

  method get_supported_types : unit -> string array =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_supported_types obj)

  method remove_supports_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context.App_info.remove_supports_type obj content_type)

  method set_as_default_for_extension : string -> (bool, GError.t) result =
    fun extension ->
      (App_info_and__app_launch_context.App_info.set_as_default_for_extension obj extension)

  method set_as_default_for_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context.App_info.set_as_default_for_type obj content_type)

  method set_as_last_used_for_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context.App_info.set_as_last_used_for_type obj content_type)

  method should_show : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context.App_info.should_show obj)

  method supports_files : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context.App_info.supports_files obj)

  method supports_uris : unit -> bool =
    fun () ->
      (App_info_and__app_launch_context.App_info.supports_uris obj)

    method as_app_info = obj
end
(* Signal class defined in gapp_launch_context_signals.ml *)


and app_launch_context (obj : App_info_and__app_launch_context.App_launch_context.t) : app_launch_context_t = object (self)
  inherit Gapp_launch_context_signals.app_launch_context_signals obj

  method launch_failed : string -> unit =
    fun startup_notify_id ->
      (App_info_and__app_launch_context.App_launch_context.launch_failed obj startup_notify_id)

  method setenv : string -> string -> unit =
    fun variable value ->
      (App_info_and__app_launch_context.App_launch_context.setenv obj variable value)

  method unsetenv : string -> unit =
    fun variable ->
      (App_info_and__app_launch_context.App_launch_context.unsetenv obj variable)

    method as_app_launch_context = obj
end
