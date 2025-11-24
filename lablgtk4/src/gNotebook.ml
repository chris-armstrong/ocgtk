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

class notebook_skel (obj : Notebook.t) = object (self)
  inherit GObj.widget_impl (Notebook.as_widget obj)

  method append_page ?(tab_label : GObj.widget option) (child : GObj.widget) =
    let label_widget = Option.map (fun l -> l#as_widget) tab_label in
    Notebook.append_page obj ~child:child#as_widget ?tab_label:label_widget ()

  method prepend_page ?(tab_label : GObj.widget option) (child : GObj.widget) =
    let label_widget = Option.map (fun l -> l#as_widget) tab_label in
    Notebook.prepend_page obj ~child:child#as_widget ?tab_label:label_widget ()

  method insert_page ?(tab_label : GObj.widget option) ~pos (child : GObj.widget) =
    let label_widget = Option.map (fun l -> l#as_widget) tab_label in
    Notebook.insert_page obj ~child:child#as_widget ?tab_label:label_widget ~position:pos ()

  method remove_page page =
    Notebook.remove_page obj ~page

  method detach_tab (child : GObj.widget) =
    Notebook.detach_tab obj ~child:child#as_widget

  method current_page = Notebook.get_current_page obj
  method set_current_page page = Notebook.set_current_page obj page

  method next_page () = Notebook.next_page obj
  method prev_page () = Notebook.prev_page obj

  method get_nth_page page_num =
    Option.map (fun w -> new GObj.widget w) (Notebook.get_nth_page obj page_num)

  method n_pages = Notebook.get_n_pages obj

  method page_num (child : GObj.widget) =
    Notebook.page_num obj child#as_widget

  method show_tabs = Notebook.get_show_tabs obj
  method set_show_tabs show = Notebook.set_show_tabs obj show

  method show_border = Notebook.get_show_border obj
  method set_show_border show = Notebook.set_show_border obj show

  method scrollable = Notebook.get_scrollable obj
  method set_scrollable scrollable = Notebook.set_scrollable obj scrollable
end

class notebook obj = object
  inherit notebook_skel obj
end

(** Create a new notebook *)
let create () =
  let notebook = Notebook.create () in
  new notebook notebook
