class column_view_row : Column_view_row.t ->
  object
    method get_accessible_description : unit -> string
    method get_accessible_label : unit -> string
    method get_activatable : unit -> bool
    method get_focusable : unit -> bool
    method get_position : unit -> int
    method get_selectable : unit -> bool
    method get_selected : unit -> bool
    method set_accessible_description : string -> unit
    method set_accessible_label : string -> unit
    method set_activatable : bool -> unit
    method set_focusable : bool -> unit
    method set_selectable : bool -> unit
    method as_column_view_row : Column_view_row.t
  end

