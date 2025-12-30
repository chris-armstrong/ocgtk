class cell_editable : Cell_editable.t ->
  object
    inherit Gcell_editable_signals.cell_editable_signals
    method editing_done : unit -> unit
    method remove_widget : unit -> unit
    method editing_canceled : bool
    method set_editing_canceled : bool -> unit
    method as_cell_editable : Cell_editable.t
  end

