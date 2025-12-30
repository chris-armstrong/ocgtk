(* High-level class for ColumnViewRow *)
class column_view_row (obj : Column_view_row.t) = object (self)

  method get_accessible_description : unit -> string =
    fun () ->
      (Column_view_row.get_accessible_description obj)

  method get_accessible_label : unit -> string =
    fun () ->
      (Column_view_row.get_accessible_label obj)

  method get_activatable : unit -> bool =
    fun () ->
      (Column_view_row.get_activatable obj)

  method get_focusable : unit -> bool =
    fun () ->
      (Column_view_row.get_focusable obj)

  method get_position : unit -> int =
    fun () ->
      (Column_view_row.get_position obj)

  method get_selectable : unit -> bool =
    fun () ->
      (Column_view_row.get_selectable obj)

  method get_selected : unit -> bool =
    fun () ->
      (Column_view_row.get_selected obj)

  method set_accessible_description : string -> unit =
    fun description ->
      (Column_view_row.set_accessible_description obj description)

  method set_accessible_label : string -> unit =
    fun label ->
      (Column_view_row.set_accessible_label obj label)

  method set_activatable : bool -> unit =
    fun activatable ->
      (Column_view_row.set_activatable obj activatable)

  method set_focusable : bool -> unit =
    fun focusable ->
      (Column_view_row.set_focusable obj focusable)

  method set_selectable : bool -> unit =
    fun selectable ->
      (Column_view_row.set_selectable obj selectable)

    method as_column_view_row = obj
end

