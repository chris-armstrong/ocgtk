(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class app_info (obj : App_info_and__app_launch_context.App_info.t) = object (self)

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

  method get_description : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_description obj)

  method get_display_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_display_name obj)

  method get_id : unit -> string option =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_id obj)

  method get_name : unit -> string =
    fun () ->
      (App_info_and__app_launch_context.App_info.get_name obj)

  method remove_supports_type : string -> (bool, GError.t) result =
    fun content_type ->
      (App_info_and__app_launch_context.App_info.remove_supports_type obj content_type)

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


and app_launch_context (obj : App_info_and__app_launch_context.App_launch_context.t) = object (self)
  inherit Gapp_launch_context_signals.app_launch_context_signals obj

  method launch_failed : string -> unit =
    fun startup_notify_id ->
      (App_info_and__app_launch_context.App_launch_context.launch_failed obj startup_notify_id)

    method as_app_launch_context = obj
end
