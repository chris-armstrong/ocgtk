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

(** High-level GtkBox wrapper for GTK4 *)

(** {1 GtkBox Container} *)

class box_skel (obj : Gtk.Box.t) = object (self)
  inherit GObj.widget_impl (Gtk.Box.coerce obj)

  method append (child : GObj.widget) =
    Gtk.Box.append obj child#as_widget

  method prepend (child : GObj.widget) =
    Gtk.Box.prepend obj child#as_widget

  method insert_child_after ~child ~sibling =
    let sibling_widget = match sibling with
      | None -> None
      | Some w -> Some w#as_widget
    in
    Gtk.Box.insert_child_after obj ~child:child#as_widget ~sibling:sibling_widget

  method remove (child : GObj.widget) =
    Gtk.Box.remove obj child#as_widget

  method reorder_child_after ~child ~sibling =
    let sibling_widget = match sibling with
      | None -> None
      | Some w -> Some w#as_widget
    in
    Gtk.Box.reorder_child_after obj ~child:child#as_widget ~sibling:sibling_widget

  method spacing = Gtk.Box.get_spacing obj
  method set_spacing spacing = Gtk.Box.set_spacing obj spacing

  method homogeneous = Gtk.Box.get_homogeneous obj
  method set_homogeneous h = Gtk.Box.set_homogeneous obj h

  method baseline_position = Gtk.Box.get_baseline_position obj
  method set_baseline_position pos = Gtk.Box.set_baseline_position obj pos
end

class box obj = object
  inherit box_skel obj
end

(** Create a horizontal box *)
let hbox ?(spacing=0) ?(homogeneous=false) () =
  let box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing in
  Gtk.Box.set_homogeneous box homogeneous;
  new box box

(** Create a vertical box *)
let vbox ?(spacing=0) ?(homogeneous=false) () =
  let box = Gtk.Box.create ~orientation:`VERTICAL ~spacing in
  Gtk.Box.set_homogeneous box homogeneous;
  new box box

(** {2 Migration Helpers} *)

(** Box with GTK3-compatible pack methods for easier migration *)
class box_pack obj = object
  inherit box obj

  method pack ?(expand=true) ?(fill=true) ?(padding=0) (child : GObj.widget) =
    (* In GTK4, these are widget properties, not packing parameters *)
    if expand then begin
      child#set_hexpand true;
      child#set_vexpand true;
    end;
    if fill then begin
      child#set_halign `FILL;
      child#set_valign `FILL;
    end;
    if padding > 0 then begin
      child#set_margin_start padding;
      child#set_margin_end padding;
    end;
    self#append child

  method pack_start ?expand ?fill ?padding child =
    self#pack ?expand ?fill ?padding child

  method pack_end ?expand ?fill ?padding (child : GObj.widget) =
    (* Set properties first *)
    let expand = match expand with None -> true | Some v -> v in
    let fill = match fill with None -> true | Some v -> v in
    let padding = match padding with None -> 0 | Some v -> v in

    if expand then begin
      child#set_hexpand true;
      child#set_vexpand true;
    end;
    if fill then begin
      child#set_halign `FILL;
      child#set_valign `FILL;
    end;
    if padding > 0 then begin
      child#set_margin_start padding;
      child#set_margin_end padding;
    end;
    (* Append to the box *)
    self#append child
    (* Note: In GTK4, there's no pack_end. Widgets are added in order.
       For true end-packing behavior, you might need to use reorder_child_after *)
end

let hbox_pack ?spacing ?homogeneous () =
  let b = hbox ?spacing ?homogeneous () in
  new box_pack (Gtk.Box.create ~orientation:`HORIZONTAL
                  ~spacing:(match spacing with None -> 0 | Some s -> s))

let vbox_pack ?spacing ?homogeneous () =
  let b = vbox ?spacing ?homogeneous () in
  new box_pack (Gtk.Box.create ~orientation:`VERTICAL
                  ~spacing:(match spacing with None -> 0 | Some s -> s))
