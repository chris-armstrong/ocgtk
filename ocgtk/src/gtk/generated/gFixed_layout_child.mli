class fixed_layout_child : Fixed_layout_child.t ->
  object
    method get_transform : unit -> Ocgtk_gsk.Gsk.transform option
    method set_transform : #Ocgtk_gsk.Gsk.transform -> unit
    method as_fixed_layout_child : Fixed_layout_child.t
  end

