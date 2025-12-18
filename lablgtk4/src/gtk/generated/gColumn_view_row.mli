class column_view_row : Column_view_row.t ->
  object
    method accessible_description : string
    method set_accessible_description : string -> unit
    method accessible_label : string
    method set_accessible_label : string -> unit
    method activatable : bool
    method set_activatable : bool -> unit
    method focusable : bool
    method set_focusable : bool -> unit
    method position : int
    method selectable : bool
    method set_selectable : bool -> unit
    method selected : bool
    method as_column_view_row : Column_view_row.t
  end

