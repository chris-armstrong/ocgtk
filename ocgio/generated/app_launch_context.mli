(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AppLaunchContext from cyclic group App_info_cycle_64c425a0 *)

(** Integrating the launch with the launching application. This is used to
    handle for instance startup notification and launching the new application
    on the same screen as the launching window.

    Its methods, signals and properties are on
    {!class-type-app_launch_context_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.App_launch_context}. *)

(** {1:class Class} *)

class type app_launch_context_t = App_info_cycle_64c425a0.app_launch_context_t
(** {b The methods, signals and properties of a [AppLaunchContext].}

    Inherits from: [GObject.Object]

    Integrating the launch with the launching application. This is used to
    handle for instance startup notification and launching the new application
    on the same screen as the launching window. *)

class app_launch_context : Raw.App_launch_context.t -> app_launch_context_t
(** Wraps a raw handle of {!Ocgio.Raw.App_launch_context.t}. *)

(** {1:constructors Constructors} *)

val new_ : unit -> app_launch_context_t
(** Creates a new application launch context. This is not normally used, instead
    you instantiate a subclass of this, such as
    {{:https://docs.gtk.org/gdk4/class.AppLaunchContext.html}[GdkAppLaunchContext]}.
*)
