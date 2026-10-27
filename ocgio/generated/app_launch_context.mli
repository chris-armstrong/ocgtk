(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AppLaunchContext from cyclic group App_info_cycle_64c425a0 *)

(** Integrating the launch with the launching application. This is used to
    handle for instance startup notification and launching the new application
    on the same screen as the launching window.

    Its methods, signals and properties are on
    {!class-type-app_launch_context_t}. The functions it is built on are in
    {!Ocgio.Raw.App_launch_context}. *)

class type app_launch_context_t = App_info_cycle_64c425a0.app_launch_context_t
(** The methods, signals and properties of a [GAppLaunchContext]. *)

class app_launch_context : Raw.App_launch_context.t -> app_launch_context_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.App_launch_context.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GAppLaunchContext], give one already wrapped. *)

val new_ : unit -> app_launch_context_t
