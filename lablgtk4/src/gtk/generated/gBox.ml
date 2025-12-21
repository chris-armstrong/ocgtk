(* High-level class for Box *)
class box (obj : Box.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Box.as_widget obj)

  method append : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Box.append obj child)

  method get_baseline_child : unit -> int =
    fun () ->
      (Box.get_baseline_child obj)

  method get_baseline_position : unit -> Gtk_enums.baselineposition =
    fun () ->
      (Box.get_baseline_position obj)

  method get_homogeneous : unit -> bool =
    fun () ->
      (Box.get_homogeneous obj)

  method get_spacing : unit -> int =
    fun () ->
      (Box.get_spacing obj)

  method insert_child_after : 'p1 'p2. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p2) option -> unit =
    fun child sibling ->
      let child = child#as_widget in
      let sibling = Option.map (fun (c) -> c#as_widget) sibling in
      (Box.insert_child_after obj child sibling)

  method prepend : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Box.prepend obj child)

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Box.remove obj child)

  method reorder_child_after : 'p1 'p2. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p2) option -> unit =
    fun child sibling ->
      let child = child#as_widget in
      let sibling = Option.map (fun (c) -> c#as_widget) sibling in
      (Box.reorder_child_after obj child sibling)

  method set_baseline_child : int -> unit =
    fun child ->
      (Box.set_baseline_child obj child)

  method set_baseline_position : Gtk_enums.baselineposition -> unit =
    fun position ->
      (Box.set_baseline_position obj position)

  method set_homogeneous : bool -> unit =
    fun homogeneous ->
      (Box.set_homogeneous obj homogeneous)

  method set_spacing : int -> unit =
    fun spacing ->
      (Box.set_spacing obj spacing)

  method as_widget = (Box.as_widget obj)
    method as_box = obj
end

