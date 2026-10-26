(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Application from cyclic group Application_and__window_and__window_group *)

class type application_t =
  Application_and__window_and__window_group.application_t

class application : Raw.Application.t -> application_t

val new_ : string option -> Ocgio.Enums.applicationflags -> application_t
