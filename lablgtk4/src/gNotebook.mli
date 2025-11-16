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

(** Base notebook skeleton with page operations *)
class notebook_skel : Gtk.Notebook.t ->
  object
    inherit GObj.widget_impl

    (** Append a page *)
    method append_page : ?tab_label:GObj.widget -> GObj.widget -> int

    (** Prepend a page *)
    method prepend_page : ?tab_label:GObj.widget -> GObj.widget -> int

    (** Insert a page at position *)
    method insert_page : ?tab_label:GObj.widget -> pos:int -> GObj.widget -> int

    (** Remove a page by index *)
    method remove_page : int -> unit

    (** Detach a tab (remove by child widget) *)
    method detach_tab : GObj.widget -> unit

    (** Get current page number *)
    method current_page : int

    (** Set current page *)
    method set_current_page : int -> unit

    (** Go to next page *)
    method next_page : unit -> unit

    (** Go to previous page *)
    method prev_page : unit -> unit

    (** Get nth page widget *)
    method get_nth_page : int -> GObj.widget option

    (** Get number of pages *)
    method n_pages : int

    (** Get page number for child widget *)
    method page_num : GObj.widget -> int

    (** Get whether tabs are shown *)
    method show_tabs : bool

    (** Set whether to show tabs *)
    method set_show_tabs : bool -> unit

    (** Get whether border is shown *)
    method show_border : bool

    (** Set whether to show border *)
    method set_show_border : bool -> unit

    (** Get scrollable mode *)
    method scrollable : bool

    (** Set scrollable mode *)
    method set_scrollable : bool -> unit
  end

(** Notebook widget with full functionality *)
class notebook : Gtk.Notebook.t ->
  object
    inherit notebook_skel
  end

(** Create a new notebook *)
val create : unit -> notebook
