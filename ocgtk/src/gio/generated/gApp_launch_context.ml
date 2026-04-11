(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AppLaunchContext from cyclic group App_info_and__app_launch_context *)

class type app_launch_context_t =
  GApp_info_and__app_launch_context.app_launch_context_t

class app_launch_context = GApp_info_and__app_launch_context.app_launch_context

let new_ () : app_launch_context_t =
  new app_launch_context
    (App_info_and__app_launch_context.App_launch_context.new_ ())
