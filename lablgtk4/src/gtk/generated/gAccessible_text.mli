class accessible_text : Accessible_text.t ->
  object
    method update_caret_position : unit -> unit
    method update_contents : Gtk_enums.accessibletextcontentchange -> int -> int -> unit
    method update_selection_bound : unit -> unit
    method as_accessible_text : Accessible_text.t
  end

