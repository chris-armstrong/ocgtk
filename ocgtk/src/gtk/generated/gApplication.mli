(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Application from cyclic group Application_and__window_and__window_group *)

class type application_t = GApplication_and__window_and__window_group.application_t

class application : Application_and__window_and__window_group.Application.t -> application_t

val new_ : string option -> Ocgtk_gio.Gio.applicationflags -> application_t
