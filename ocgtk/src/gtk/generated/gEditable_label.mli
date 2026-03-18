class editable_label : Editable_label.t ->
  object
    method get_editing : unit -> bool
    method start_editing : unit -> unit
    method stop_editing : bool -> unit
    method as_editable_label : Editable_label.t
  end

