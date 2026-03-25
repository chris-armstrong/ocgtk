class type box_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method append : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_baseline_child : unit -> int
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method get_homogeneous : unit -> bool
    method get_spacing : unit -> int
    method insert_child_after : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method prepend : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method reorder_child_after : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_baseline_child : int -> unit
    method set_baseline_position : Gtk_enums.baselineposition -> unit
    method set_homogeneous : bool -> unit
    method set_spacing : int -> unit
    method as_box : Box.t
end

(* High-level class for Box *)
class box (obj : Box.t) : box_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method append : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
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

  method insert_child_after : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child sibling ->
      let child = child#as_widget in
      let sibling = Option.map (fun (c) -> c#as_widget) sibling in
      (Box.insert_child_after obj child sibling)

  method prepend : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Box.prepend obj child)

  method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Box.remove obj child)

  method reorder_child_after : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
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

    method as_box = obj
end

let new_ (orientation : Gtk_enums.orientation) (spacing : int) : box_t =
  let obj_ = Box.new_ orientation spacing in
  new box obj_

