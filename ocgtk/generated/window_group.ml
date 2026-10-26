(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for WindowGroup from cyclic group Application_and__window_and__window_group *)

class type window_group_t =
  GApplication_and__window_and__window_group.window_group_t

class window_group = GApplication_and__window_and__window_group.window_group

let new_ () : window_group_t =
  new window_group
    (Application_and__window_and__window_group.Window_group.new_ ())
