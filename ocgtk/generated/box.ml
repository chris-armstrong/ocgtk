class type box_t = object
  inherit Widget.widget_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method append : Widget.widget_t -> unit
  (** Adds a child at the end. *)

  method get_baseline_child : unit -> int
  (** Gets the value set by [Gtk.Box.set_baseline_child]. *)

  method get_baseline_position : unit -> Enums.baselineposition
  (** Gets the value set by [Gtk.Box.set_baseline_position]. *)

  method get_homogeneous : unit -> bool
  (** Returns whether the box is homogeneous.

      In a homogeneous box all children are the same size. *)

  method get_spacing : unit -> int
  (** Gets the value set by [Gtk.Box.set_spacing]. *)

  method insert_child_after : Widget.widget_t -> Widget.widget_t option -> unit
  (** Inserts a child at a specific position.

      The child is added after [sibling] in the list of [box] children.

      If [sibling] is [NULL], the [child] is placed at the beginning. *)

  method prepend : Widget.widget_t -> unit
  (** Adds a child at the beginning. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child widget from the box.

      The child must have been added before with [Gtk.Box.append],
      [Gtk.Box.prepend], or [Gtk.Box.insert_child_after]. *)

  method reorder_child_after : Widget.widget_t -> Widget.widget_t option -> unit
  (** Moves a child to a different position.

      The child is moved to the position after [sibling] in the list of [box]
      children.

      If [sibling] is [NULL], the child is placed at the beginning. *)

  method set_baseline_child : int -> unit
  (** Sets the baseline child of a box.

      This affects only vertical boxes. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the baseline position of a box.

      This affects only horizontal boxes with at least one baseline aligned
      child. If there is more vertical space available than requested, and the
      baseline is not allocated by the parent then [position] is used to
      allocate the baseline with respect to the extra space available. *)

  method set_homogeneous : bool -> unit
  (** Sets whether or not all children are given equal space in the box. *)

  method set_spacing : int -> unit
  (** Sets the number of pixels to place between children. *)

  (** {2:conversions Conversions} *)

  method as_box : Raw.Box.t
end

(* High-level class for Box *)
class box (obj : Raw.Box.t) : box_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method append : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Box.append obj child

    method get_baseline_child : unit -> int =
      fun () -> Raw.Box.get_baseline_child obj

    method get_baseline_position : unit -> Enums.baselineposition =
      fun () -> Raw.Box.get_baseline_position obj

    method get_homogeneous : unit -> bool =
      fun () -> Raw.Box.get_homogeneous obj

    method get_spacing : unit -> int = fun () -> Raw.Box.get_spacing obj

    method insert_child_after :
        Widget.widget_t -> Widget.widget_t option -> unit =
      fun child sibling ->
        let child = child#as_widget in
        let sibling = Option.map (fun c -> c#as_widget) sibling in
        Raw.Box.insert_child_after obj child sibling

    method prepend : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Box.prepend obj child

    method remove : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Box.remove obj child

    method reorder_child_after :
        Widget.widget_t -> Widget.widget_t option -> unit =
      fun child sibling ->
        let child = child#as_widget in
        let sibling = Option.map (fun c -> c#as_widget) sibling in
        Raw.Box.reorder_child_after obj child sibling

    method set_baseline_child : int -> unit =
      fun child -> Raw.Box.set_baseline_child obj child

    method set_baseline_position : Enums.baselineposition -> unit =
      fun position -> Raw.Box.set_baseline_position obj position

    method set_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Box.set_homogeneous obj homogeneous

    method set_spacing : int -> unit =
      fun spacing -> Raw.Box.set_spacing obj spacing

    method as_box = obj
  end

let new_ (orientation : Enums.orientation) (spacing : int) : box_t =
  let obj_ = Raw.Box.new_ orientation spacing in
  new box obj_
