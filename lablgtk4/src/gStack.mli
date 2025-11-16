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

(** High-level GtkStack wrapper for GTK4 *)

(** {1 GtkStack Container} *)

(** Base stack skeleton with layered child operations *)
class stack_skel : Gtk.Stack.t ->
  object
    inherit GObj.widget_impl

    (** Add a named child *)
    method add_named : name:string -> GObj.widget -> unit

    (** Add a titled child *)
    method add_titled : name:string -> title:string -> GObj.widget -> unit

    (** Add a child without a name *)
    method add_child : GObj.widget -> unit

    (** Remove a child *)
    method remove : GObj.widget -> unit

    (** Get visible child widget *)
    method visible_child : GObj.widget option

    (** Set visible child by widget *)
    method set_visible_child : GObj.widget -> unit

    (** Set visible child by name *)
    method set_visible_child_name : string -> unit

    (** Get visible child name *)
    method visible_child_name : string option

    (** Get transition type *)
    method transition_type : Gtk.stack_transition_type

    (** Set transition type *)
    method set_transition_type : Gtk.stack_transition_type -> unit

    (** Get transition duration (milliseconds) *)
    method transition_duration : int

    (** Set transition duration (milliseconds) *)
    method set_transition_duration : int -> unit
  end

(** Stack widget with full functionality *)
class stack : Gtk.Stack.t ->
  object
    inherit stack_skel
  end

(** Create a new stack *)
val create : unit -> stack
