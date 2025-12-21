(* High-level class for BoxLayout *)
class box_layout (obj : Box_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Box_layout.as_layoutmanager obj)

  method get_baseline_child : unit -> int =
    fun () ->
      (Box_layout.get_baseline_child obj)

  method get_baseline_position : unit -> Gtk_enums.baselineposition =
    fun () ->
      (Box_layout.get_baseline_position obj)

  method get_homogeneous : unit -> bool =
    fun () ->
      (Box_layout.get_homogeneous obj)

  method get_spacing : unit -> int =
    fun () ->
      (Box_layout.get_spacing obj)

  method set_baseline_child : int -> unit =
    fun child ->
      (Box_layout.set_baseline_child obj child)

  method set_baseline_position : Gtk_enums.baselineposition -> unit =
    fun position ->
      (Box_layout.set_baseline_position obj position)

  method set_homogeneous : bool -> unit =
    fun homogeneous ->
      (Box_layout.set_homogeneous obj homogeneous)

  method set_spacing : int -> unit =
    fun spacing ->
      (Box_layout.set_spacing obj spacing)

  method as_layoutmanager = (Box_layout.as_layoutmanager obj)
    method as_box_layout = obj
end

