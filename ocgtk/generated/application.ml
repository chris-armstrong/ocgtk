(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Application from cyclic group Application_and__window_and__window_group *)

class type application_t =
  Application_and__window_and__window_group.application_t

class application = Application_and__window_and__window_group.application

let new_ (application_id : string option) (flags : Ocgio.Enums.applicationflags)
    : application_t =
  let obj_ = Raw.Application.new_ application_id flags in
  new application obj_
