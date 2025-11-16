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

(** High-level GtkGrid wrapper for GTK4 *)

(** {1 GtkGrid Container} *)

class grid_skel (obj : Gtk.Grid.t) = object (self)
  inherit GObj.widget_impl (Gtk.Grid.as_widget obj)

  method attach ~left ~top ~width ~height (child : GObj.widget) =
    Gtk.Grid.attach obj ~child:child#as_widget ~column:left ~row:top ~width ~height

  method attach_next_to ~(child : GObj.widget) ~(sibling : GObj.widget option) ~side ~width ~height =
    let sibling_widget = match sibling with
      | None -> None
      | Some w -> Some w#as_widget
    in
    Gtk.Grid.attach_next_to obj ~child:child#as_widget ~sibling:sibling_widget ~side ~width ~height

  method remove (child : GObj.widget) =
    Gtk.Grid.remove obj child#as_widget

  method get_child_at ~column ~row =
    match Gtk.Grid.get_child_at obj ~column ~row with
    | None -> None
    | Some w -> Some (new GObj.widget w)

  method insert_row position =
    Gtk.Grid.insert_row obj ~position

  method insert_column position =
    Gtk.Grid.insert_column obj ~position

  method insert_next_to ~(sibling : GObj.widget) ~side =
    Gtk.Grid.insert_next_to obj ~sibling:sibling#as_widget ~side

  method remove_row position =
    Gtk.Grid.remove_row obj ~position

  method remove_column position =
    Gtk.Grid.remove_column obj ~position

  method row_spacing = Gtk.Grid.get_row_spacing obj
  method set_row_spacing spacing = Gtk.Grid.set_row_spacing obj spacing

  method column_spacing = Gtk.Grid.get_column_spacing obj
  method set_column_spacing spacing = Gtk.Grid.set_column_spacing obj spacing

  method row_homogeneous = Gtk.Grid.get_row_homogeneous obj
  method set_row_homogeneous h = Gtk.Grid.set_row_homogeneous obj h

  method column_homogeneous = Gtk.Grid.get_column_homogeneous obj
  method set_column_homogeneous h = Gtk.Grid.set_column_homogeneous obj h

  method baseline_row = Gtk.Grid.get_baseline_row obj
  method set_baseline_row row = Gtk.Grid.set_baseline_row obj row
end

class grid obj = object
  inherit grid_skel obj
end

(** Create a new grid *)
let create ?(row_spacing=0) ?(column_spacing=0) ?(row_homogeneous=false) ?(column_homogeneous=false) () =
  let grid = Gtk.Grid.create () in
  Gtk.Grid.set_row_spacing grid row_spacing;
  Gtk.Grid.set_column_spacing grid column_spacing;
  Gtk.Grid.set_row_homogeneous grid row_homogeneous;
  Gtk.Grid.set_column_homogeneous grid column_homogeneous;
  new grid grid
