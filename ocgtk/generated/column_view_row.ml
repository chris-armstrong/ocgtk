class type column_view_row_t = object
  method get_accessible_description : unit -> string
  method get_accessible_label : unit -> string
  method get_activatable : unit -> bool
  method get_focusable : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_position : unit -> int
  method get_selectable : unit -> bool
  method get_selected : unit -> bool
  method set_accessible_description : string -> unit
  method set_accessible_label : string -> unit
  method set_activatable : bool -> unit
  method set_focusable : bool -> unit
  method set_selectable : bool -> unit
  method as_column_view_row : Raw.Column_view_row.t
end

(* High-level class for ColumnViewRow *)
class column_view_row (obj : Raw.Column_view_row.t) : column_view_row_t =
  object (self)
    method get_accessible_description : unit -> string =
      fun () -> Raw.Column_view_row.get_accessible_description obj

    method get_accessible_label : unit -> string =
      fun () -> Raw.Column_view_row.get_accessible_label obj

    method get_activatable : unit -> bool =
      fun () -> Raw.Column_view_row.get_activatable obj

    method get_focusable : unit -> bool =
      fun () -> Raw.Column_view_row.get_focusable obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Column_view_row.get_item obj

    method get_position : unit -> int =
      fun () -> Raw.Column_view_row.get_position obj

    method get_selectable : unit -> bool =
      fun () -> Raw.Column_view_row.get_selectable obj

    method get_selected : unit -> bool =
      fun () -> Raw.Column_view_row.get_selected obj

    method set_accessible_description : string -> unit =
      fun description ->
        Raw.Column_view_row.set_accessible_description obj description

    method set_accessible_label : string -> unit =
      fun label -> Raw.Column_view_row.set_accessible_label obj label

    method set_activatable : bool -> unit =
      fun activatable -> Raw.Column_view_row.set_activatable obj activatable

    method set_focusable : bool -> unit =
      fun focusable -> Raw.Column_view_row.set_focusable obj focusable

    method set_selectable : bool -> unit =
      fun selectable -> Raw.Column_view_row.set_selectable obj selectable

    method as_column_view_row = obj
  end
