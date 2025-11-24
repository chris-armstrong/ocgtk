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

class stack_skel (obj : Stack.t) = object (self)
  inherit GObj.widget_impl (Stack.as_widget obj)

  method add_named ~name (child : GObj.widget) =
    Stack.add_named obj child#as_widget name

  method add_titled ~name ~title (child : GObj.widget) =
    Stack.add_titled obj child#as_widget name title

  method add_child (child : GObj.widget) =
    Stack.add_child obj child#as_widget

  method remove (child : GObj.widget) =
    Stack.remove obj child#as_widget

  method visible_child =
    Option.map (fun w -> new GObj.widget w) (Stack.get_visible_child obj)

  method set_visible_child (child : GObj.widget) =
    Stack.set_visible_child obj child#as_widget

  method set_visible_child_name name =
    Stack.set_visible_child_name obj name

  method visible_child_name =
    Stack.get_visible_child_name obj

  method transition_type = Stack.get_transition_type obj
  method set_transition_type tt = Stack.set_transition_type obj tt

  method transition_duration = Stack.get_transition_duration obj
  method set_transition_duration duration = Stack.set_transition_duration obj duration
end

class stack obj = object
  inherit stack_skel obj
end

(** Create a new stack *)
let create () =
  let stack = Stack.create () in
  new stack stack
