(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AppLaunchContext from cyclic group App_info_cycle_64c425a0 *)

class type app_launch_context_t = App_info_cycle_64c425a0.app_launch_context_t

class app_launch_context = App_info_cycle_64c425a0.app_launch_context

let new_ () : app_launch_context_t =
  new app_launch_context (Raw.App_launch_context.new_ ())
