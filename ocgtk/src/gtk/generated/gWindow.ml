(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Window from cyclic group Application_and__window_and__window_group *)

class type window_t = GApplication_and__window_and__window_group.window_t

class window = GApplication_and__window_and__window_group.window
let new_ () : window_t =
  new window (Application_and__window_and__window_group.Window.new_ ())

