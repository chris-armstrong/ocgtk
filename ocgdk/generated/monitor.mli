(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Monitor from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents the individual outputs that are associated with a [GdkDisplay].

    Its methods, signals and properties are on {!class-type-monitor_t}. Its full
    description is under {!section-description}. The functions it is built on
    are in {!Ocgdk.Raw.Monitor}. *)

(** {1:class Class} *)

class type monitor_t = App_launch_context_cycle_de440b34.monitor_t
(** {b The methods, signals and properties of a [Monitor].}

    Inherits from: [GObject.Object]

    Represents the individual outputs that are associated with a [GdkDisplay].

    [GdkDisplay] keeps a [GListModel] to enumerate and monitor monitors with
    [Gdk.Display.get_monitors]. You can use [Gdk.Display.get_monitor_at_surface]
    to find a particular monitor. *)

class monitor : Raw.Monitor.t -> monitor_t
(** Wraps a raw handle of {!Ocgdk.Raw.Monitor.t}. *)

(** {1:description Description}

    Represents the individual outputs that are associated with a [GdkDisplay].

    [GdkDisplay] keeps a [GListModel] to enumerate and monitor monitors with
    [Gdk.Display.get_monitors]. You can use [Gdk.Display.get_monitor_at_surface]
    to find a particular monitor. *)
