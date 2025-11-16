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

(** {1 Box Packing Conveniences} *)

(** Create a horizontal box with widgets packed in sequence.

    This is a convenience function that creates an hbox and packs all
    provided widgets using {!GBox.box_pack.pack}.

    @param spacing spacing between children in pixels (default: 0)
    @param homogeneous whether all children should have the same size (default: false)
    @param widgets list of widgets to pack
    @return a horizontal box with all widgets packed *)
val hbox_pack :
  ?spacing:int ->
  ?homogeneous:bool ->
  GObj.widget list ->
  GBox.box_pack

(** Create a vertical box with widgets packed in sequence.

    This is a convenience function that creates a vbox and packs all
    provided widgets using {!GBox.box_pack.pack}.

    @param spacing spacing between children in pixels (default: 0)
    @param homogeneous whether all children should have the same size (default: false)
    @param widgets list of widgets to pack
    @return a vertical box with all widgets packed *)
val vbox_pack :
  ?spacing:int ->
  ?homogeneous:bool ->
  GObj.widget list ->
  GBox.box_pack

(** {1 Grid Packing Conveniences} *)

(** Create a grid with widgets attached at specified positions.

    Each widget is specified as a tuple (widget, column, row, width, height)
    where column and row are 0-indexed positions, and width and height are
    the number of columns/rows to span.

    @param row_spacing spacing between rows in pixels (default: 0)
    @param column_spacing spacing between columns in pixels (default: 0)
    @param row_homogeneous whether all rows should have the same height (default: false)
    @param column_homogeneous whether all columns should have the same width (default: false)
    @param attachments list of (widget, column, row, width, height) tuples
    @return a grid with all widgets attached *)
val grid_attach :
  ?row_spacing:int ->
  ?column_spacing:int ->
  ?row_homogeneous:bool ->
  ?column_homogeneous:bool ->
  (GObj.widget * int * int * int * int) list ->
  GGrid.grid

(** {1 Paned Conveniences} *)

(** Create a paned widget with start and end children.

    @param orientation horizontal or vertical orientation
    @param start_child widget for the start pane (optional)
    @param end_child widget for the end pane (optional)
    @param position initial position of the divider in pixels (optional)
    @return a paned widget with children set *)
val paned :
  orientation:Gtk.orientation ->
  ?start_child:GObj.widget ->
  ?end_child:GObj.widget ->
  ?position:int ->
  unit ->
  GPaned.paned

(** Create a horizontal paned widget.

    @param start_child widget for the start (left) pane (optional)
    @param end_child widget for the end (right) pane (optional)
    @param position initial position of the divider in pixels (optional)
    @return a horizontal paned widget *)
val hpaned :
  ?start_child:GObj.widget ->
  ?end_child:GObj.widget ->
  ?position:int ->
  unit ->
  GPaned.paned

(** Create a vertical paned widget.

    @param start_child widget for the start (top) pane (optional)
    @param end_child widget for the end (bottom) pane (optional)
    @param position initial position of the divider in pixels (optional)
    @return a vertical paned widget *)
val vpaned :
  ?start_child:GObj.widget ->
  ?end_child:GObj.widget ->
  ?position:int ->
  unit ->
  GPaned.paned

(** {1 Notebook Conveniences} *)

(** Create a notebook with pages.

    Each page is specified as a tuple (child_widget, tab_label_widget option).
    If tab_label_widget is None, the page will have no label.

    Note: Since GtkLabel is not yet implemented, you can use any widget as a
    tab label, or pass None for unlabeled tabs.

    @param show_tabs whether to show tabs (default: true)
    @param show_border whether to show border (default: true)
    @param pages list of (child_widget, tab_label_widget option) tuples
    @return a notebook with all pages added *)
val notebook :
  ?show_tabs:bool ->
  ?show_border:bool ->
  (GObj.widget * GObj.widget option) list ->
  GNotebook.notebook

(** {1 Window and ScrolledWindow Conveniences} *)

(** Create a window with a child widget *)
val window :
  ?title:string ->
  ?width:int ->
  ?height:int ->
  ?resizable:bool ->
  ?modal:bool ->
  GObj.widget ->
  GWindow.window

(** Create a scrolled window with a child widget *)
val scrolled :
  ?hpolicy:Gtk.ScrolledWindow.policy_type ->
  ?vpolicy:Gtk.ScrolledWindow.policy_type ->
  ?min_content_width:int ->
  ?min_content_height:int ->
  GObj.widget ->
  GScrolledWindow.scrolled_window
