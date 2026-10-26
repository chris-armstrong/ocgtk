(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Window from cyclic group Application_and__window_and__window_group *)

class type window_t = Application_and__window_and__window_group.window_t

class window = Application_and__window_and__window_group.window

let new_ () : window_t = new window (Raw.Window.new_ ())
