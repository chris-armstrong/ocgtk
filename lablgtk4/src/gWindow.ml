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

(** High-level GtkWindow wrapper for GTK4 *)

(** {1 GtkWindow} *)

class window_skel (obj : Gtk.Window.t) = object (self)
  inherit GObj.widget_impl (Gtk.Window.as_widget obj)

  method set_child (child : GObj.widget option) =
    let widget_opt = match child with
      | None -> None
      | Some w -> Some w#as_widget
    in
    Gtk.Window.set_child obj widget_opt

  method child =
    match Gtk.Window.get_child obj with
    | None -> None
    | Some w -> Some (new GObj.widget w)

  method add (child : GObj.widget) =
    self#set_child (Some child)

  method title = Gtk.Window.get_title obj
  method set_title title = Gtk.Window.set_title obj title

  method set_default_size ~width ~height =
    Gtk.Window.set_default_size obj ~width ~height

  method get_default_size = Gtk.Window.get_default_size obj

  method resizable = Gtk.Window.get_resizable obj
  method set_resizable r = Gtk.Window.set_resizable obj r

  method modal = Gtk.Window.get_modal obj
  method set_modal m = Gtk.Window.set_modal obj m

  method destroy = Gtk.Window.destroy obj
  method present = Gtk.Window.present obj
  method close = Gtk.Window.close obj
end

class window obj = object
  inherit window_skel obj
end

(** Create a new window *)
let window ?(title="") ?(width=(-1)) ?(height=(-1)) ?(resizable=true) ?(modal=false) () =
  let w = Gtk.Window.create () in
  if title <> "" then Gtk.Window.set_title w title;
  if width > 0 || height > 0 then
    Gtk.Window.set_default_size w ~width:(if width > 0 then width else -1)
                                   ~height:(if height > 0 then height else -1);
  Gtk.Window.set_resizable w resizable;
  Gtk.Window.set_modal w modal;
  new window w
