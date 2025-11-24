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

(** High-level GtkPaned wrapper for GTK4 *)

(** {1 GtkPaned Container} *)

class paned_skel (obj : Paned.t) = object (self)
  inherit GObj.widget_impl (Paned.as_widget obj)

  method set_start_child (child : GObj.widget option) =
    let w = Option.map (fun c -> c#as_widget) child in
    Paned.set_start_child obj w

  method start_child =
    Option.map (fun w -> new GObj.widget w) (Paned.get_start_child obj)

  method set_end_child (child : GObj.widget option) =
    let w = Option.map (fun c -> c#as_widget) child in
    Paned.set_end_child obj w

  method end_child =
    Option.map (fun w -> new GObj.widget w) (Paned.get_end_child obj)

  method position = Paned.get_position obj
  method set_position pos = Paned.set_position obj pos

  method wide_handle = Paned.get_wide_handle obj
  method set_wide_handle w = Paned.set_wide_handle obj w

  method resize_start_child = Paned.get_resize_start_child obj
  method set_resize_start_child r = Paned.set_resize_start_child obj r

  method resize_end_child = Paned.get_resize_end_child obj
  method set_resize_end_child r = Paned.set_resize_end_child obj r

  method shrink_start_child = Paned.get_shrink_start_child obj
  method set_shrink_start_child s = Paned.set_shrink_start_child obj s

  method shrink_end_child = Paned.get_shrink_end_child obj
  method set_shrink_end_child s = Paned.set_shrink_end_child obj s

  method add1 (child : GObj.widget) =
    self#set_start_child (Some child)

  method add2 (child : GObj.widget) =
    self#set_end_child (Some child)
end

class paned obj = object
  inherit paned_skel obj
end

(** Create a horizontal paned container *)
let hpaned () =
  let paned = Paned.create ~orientation:`HORIZONTAL in
  new paned paned

(** Create a vertical paned container *)
let vpaned () =
  let paned = Paned.create ~orientation:`VERTICAL in
  new paned paned
