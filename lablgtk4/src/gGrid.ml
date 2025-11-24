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

class grid_skel (obj : Grid.t) = object (self)
  inherit GObj.widget_impl (Grid.as_widget obj)

  method attach ~left ~top ~width ~height (child : GObj.widget) =
    Grid.attach obj ~child:child#as_widget ~column:left ~row:top ~width ~height

  method attach_next_to ~(child : GObj.widget) ~(sibling : GObj.widget option) ~side ~width ~height =
    let sibling_widget = match sibling with
      | None -> None
      | Some w -> Some w#as_widget
    in
    Grid.attach_next_to obj ~child:child#as_widget ~sibling:sibling_widget ~side ~width ~height

  method remove (child : GObj.widget) =
    Grid.remove obj child#as_widget

  method get_child_at ~column ~row =
    match Grid.get_child_at obj ~column ~row with
    | None -> None
    | Some w -> Some (new GObj.widget w)

  method insert_row position =
    Grid.insert_row obj ~position

  method insert_column position =
    Grid.insert_column obj ~position

  method insert_next_to ~(sibling : GObj.widget) ~side =
    Grid.insert_next_to obj ~sibling:sibling#as_widget ~side

  method remove_row position =
    Grid.remove_row obj ~position

  method remove_column position =
    Grid.remove_column obj ~position

  method row_spacing = Grid.get_row_spacing obj
  method set_row_spacing spacing = Grid.set_row_spacing obj spacing

  method column_spacing = Grid.get_column_spacing obj
  method set_column_spacing spacing = Grid.set_column_spacing obj spacing

  method row_homogeneous = Grid.get_row_homogeneous obj
  method set_row_homogeneous h = Grid.set_row_homogeneous obj h

  method column_homogeneous = Grid.get_column_homogeneous obj
  method set_column_homogeneous h = Grid.set_column_homogeneous obj h

  method baseline_row = Grid.get_baseline_row obj
  method set_baseline_row row = Grid.set_baseline_row obj row
end

class grid obj = object
  inherit grid_skel obj
end

(** Create a new grid *)
let create ?(row_spacing=0) ?(column_spacing=0) ?(row_homogeneous=false) ?(column_homogeneous=false) () =
  let grid = Grid.create () in
  Grid.set_row_spacing grid row_spacing;
  Grid.set_column_spacing grid column_spacing;
  Grid.set_row_homogeneous grid row_homogeneous;
  Grid.set_column_homogeneous grid column_homogeneous;
  new grid grid
