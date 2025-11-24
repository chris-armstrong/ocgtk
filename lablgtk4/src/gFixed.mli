(**************************************************************************)
(*                Lablgtk4                                                *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(** High-level GtkFixed wrapper for GTK4 *)

(** {1 GtkFixed Container} *)

(** Base fixed skeleton with absolute positioning operations *)
class fixed_skel : Fixed.t ->
  object
    inherit GObj.widget_impl

    (** Place widget at absolute position *)
    method put : x:float -> y:float -> GObj.widget -> unit

    (** Move widget to new position *)
    method move : x:float -> y:float -> GObj.widget -> unit

    (** Remove a child widget *)
    method remove : GObj.widget -> unit

    (** Get child position *)
    method get_child_position : GObj.widget -> float * float
  end

(** Fixed widget with full functionality *)
class fixed : Fixed.t ->
  object
    inherit fixed_skel
  end

(** Create a new fixed container *)
val create : unit -> fixed
