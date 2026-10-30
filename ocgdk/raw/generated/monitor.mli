(* GENERATED CODE - DO NOT EDIT *)
(* Monitor, a member of the cyclic module App_launch_context_cycle_de440b34 *)

(** Represents the individual outputs that are associated with a [GdkDisplay].

    [GdkDisplay] keeps a [GListModel] to enumerate and monitor monitors with
    {{!Ocgdk.Raw.Display.val-get_monitors}[Gdk.Display.get_monitors]}. You can
    use
    {{!Ocgdk.Raw.Display.val-get_monitor_at_surface}[Gdk.Display.get_monitor_at_surface]}
    to find a particular monitor.

    The class built on this module is in {!Ocgdk.Monitor}. *)

include module type of struct
  include App_launch_context_cycle_de440b34.Monitor
end
