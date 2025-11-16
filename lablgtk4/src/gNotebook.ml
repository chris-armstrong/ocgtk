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

(** High-level GtkNotebook wrapper for GTK4 *)

(** {1 GtkNotebook Container} *)

class notebook_skel (obj : Gtk.Notebook.t) = object (self)
  inherit GObj.widget_impl (Gtk.Notebook.as_widget obj)

  method append_page ?tab_label (child : GObj.widget) =
    let label_widget = Option.map (fun l -> l#as_widget) tab_label in
    Gtk.Notebook.append_page obj ~child:child#as_widget ?tab_label:label_widget ()

  method prepend_page ?tab_label (child : GObj.widget) =
    let label_widget = Option.map (fun l -> l#as_widget) tab_label in
    Gtk.Notebook.prepend_page obj ~child:child#as_widget ?tab_label:label_widget ()

  method insert_page ?tab_label ~pos (child : GObj.widget) =
    let label_widget = Option.map (fun l -> l#as_widget) tab_label in
    Gtk.Notebook.insert_page obj ~child:child#as_widget ?tab_label:label_widget ~position:pos ()

  method remove_page page =
    Gtk.Notebook.remove_page obj ~page

  method detach_tab (child : GObj.widget) =
    Gtk.Notebook.detach_tab obj ~child:child#as_widget

  method current_page = Gtk.Notebook.get_current_page obj
  method set_current_page page = Gtk.Notebook.set_current_page obj page

  method next_page () = Gtk.Notebook.next_page obj
  method prev_page () = Gtk.Notebook.prev_page obj

  method get_nth_page page_num =
    Option.map (fun w -> new GObj.widget w) (Gtk.Notebook.get_nth_page obj page_num)

  method n_pages = Gtk.Notebook.get_n_pages obj

  method page_num (child : GObj.widget) =
    Gtk.Notebook.page_num obj child#as_widget

  method show_tabs = Gtk.Notebook.get_show_tabs obj
  method set_show_tabs show = Gtk.Notebook.set_show_tabs obj show

  method show_border = Gtk.Notebook.get_show_border obj
  method set_show_border show = Gtk.Notebook.set_show_border obj show

  method scrollable = Gtk.Notebook.get_scrollable obj
  method set_scrollable scrollable = Gtk.Notebook.set_scrollable obj scrollable
end

class notebook obj = object
  inherit notebook_skel obj
end

(** Create a new notebook *)
let create () =
  let notebook = Gtk.Notebook.create () in
  new notebook notebook
