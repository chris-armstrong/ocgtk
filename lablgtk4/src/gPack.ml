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

(** Convenience functions for creating and packing widgets *)

(* Box packing conveniences *)

let hbox_pack ?(spacing=0) ?(homogeneous=false) widgets =
  let box = GBox.hbox_pack ~spacing ~homogeneous () in
  List.iter (fun w -> box#pack w) widgets;
  box

let vbox_pack ?(spacing=0) ?(homogeneous=false) widgets =
  let box = GBox.vbox_pack ~spacing ~homogeneous () in
  List.iter (fun w -> box#pack w) widgets;
  box

(* Grid packing conveniences *)

let grid_attach
    ?(row_spacing=0)
    ?(column_spacing=0)
    ?(row_homogeneous=false)
    ?(column_homogeneous=false)
    attachments =
  let grid = GGrid.create ~row_spacing ~column_spacing
                          ~row_homogeneous ~column_homogeneous () in
  List.iter (fun (widget, column, row, width, height) ->
    grid#attach ~left:column ~top:row ~width ~height widget
  ) attachments;
  grid

(* Paned conveniences *)

let paned ~orientation ?start_child ?end_child ?position () =
  let paned = new GPaned.paned (Gtk.Paned.create ~orientation) in
  (match start_child with
   | Some w -> paned#set_start_child (Some w)
   | None -> ());
  (match end_child with
   | Some w -> paned#set_end_child (Some w)
   | None -> ());
  (match position with
   | Some pos -> paned#set_position pos
   | None -> ());
  paned

let hpaned ?start_child ?end_child ?position () =
  let paned = GPaned.hpaned () in
  (match start_child with
   | Some w -> paned#set_start_child (Some w)
   | None -> ());
  (match end_child with
   | Some w -> paned#set_end_child (Some w)
   | None -> ());
  (match position with
   | Some pos -> paned#set_position pos
   | None -> ());
  paned

let vpaned ?start_child ?end_child ?position () =
  let paned = GPaned.vpaned () in
  (match start_child with
   | Some w -> paned#set_start_child (Some w)
   | None -> ());
  (match end_child with
   | Some w -> paned#set_end_child (Some w)
   | None -> ());
  (match position with
   | Some pos -> paned#set_position pos
   | None -> ());
  paned

(* Notebook conveniences *)

let notebook ?(show_tabs=true) ?(show_border=true) pages =
  let nb = GNotebook.create () in
  nb#set_show_tabs show_tabs;
  nb#set_show_border show_border;
  List.iter (fun (child, tab_label) ->
    let _ = nb#append_page ?tab_label child in ()
  ) pages;
  nb

(** {1 Window and ScrolledWindow Conveniences} *)

(** Create a window with a child widget *)
let window ?(title="") ?(width=(-1)) ?(height=(-1)) ?(resizable=true) ?(modal=false) child =
  let w = GWindow.window ~title ~width ~height ~resizable ~modal () in
  w#add child;
  w

(** Create a scrolled window with a child widget *)
let scrolled ?(hpolicy=`AUTOMATIC) ?(vpolicy=`AUTOMATIC) ?(min_content_width=(-1)) ?(min_content_height=(-1)) child =
  let sw = GScrolledWindow.scrolled_window ~hpolicy ~vpolicy ~min_content_width ~min_content_height () in
  sw#add child;
  sw
