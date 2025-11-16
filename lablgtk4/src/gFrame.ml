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

(** High-level GtkFrame wrapper for GTK4 *)

(** {1 GtkFrame} *)

class frame_skel (obj : Gtk.Frame.t) = object (self)
  inherit GObj.widget_impl (Gtk.Frame.as_widget obj)

  method set_child (child : GObj.widget option) =
    let widget_opt = match child with
      | None -> None
      | Some w -> Some w#as_widget
    in
    Gtk.Frame.set_child obj widget_opt

  method child =
    match Gtk.Frame.get_child obj with
    | None -> None
    | Some w -> Some (new GObj.widget w)

  method add (child : GObj.widget) =
    self#set_child (Some child)

  method label = Gtk.Frame.get_label obj
  method set_label label = Gtk.Frame.set_label obj label

  method label_xalign = Gtk.Frame.get_label_xalign obj
  method set_label_xalign align = Gtk.Frame.set_label_xalign obj align
end

class frame obj = object
  inherit frame_skel obj
end

(** Create a new frame *)
let frame ?(label : string option) ?(label_xalign=0.0) () =
  let f = Gtk.Frame.create ?label () in
  if label_xalign <> 0.0 then
    Gtk.Frame.set_label_xalign f label_xalign;
  new frame f
