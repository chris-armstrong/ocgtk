class type box_layout_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager_t
    method get_baseline_child : unit -> int
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method get_homogeneous : unit -> bool
    method get_spacing : unit -> int
    method set_baseline_child : int -> unit
    method set_baseline_position : Gtk_enums.baselineposition -> unit
    method set_homogeneous : bool -> unit
    method set_spacing : int -> unit
    method as_box_layout : Box_layout.t
end

(* High-level class for BoxLayout *)
class box_layout (obj : Box_layout.t) : box_layout_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t)

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

    method as_box_layout = obj
end

let new_ (orientation : Gtk_enums.orientation) : box_layout_t =
  new box_layout (Box_layout.new_ orientation)

