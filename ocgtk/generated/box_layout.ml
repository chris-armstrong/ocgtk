class type box_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  inherit Orientable.orientable_t

  method get_baseline_child : unit -> int
  (** Gets the value set by gtk_box_layout_set_baseline_child(). *)

  method get_baseline_position : unit -> Enums.baselineposition
  (** Gets the value set by gtk_box_layout_set_baseline_position(). *)

  method get_homogeneous : unit -> bool
  (** Returns whether the layout is set to be homogeneous. *)

  method get_spacing : unit -> int
  (** Returns the space that [box_layout] puts between children. *)

  method set_baseline_child : int -> unit
  (** Sets the index of the child that determines the baseline in vertical
      layout. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the baseline position of a box layout.

      The baseline position affects only horizontal boxes with at least one
      baseline aligned child. If there is more vertical space available than
      requested, and the baseline is not allocated by the parent then the given
      [position] is used to allocate the baseline within the extra space
      available. *)

  method set_homogeneous : bool -> unit
  (** Sets whether the box layout will allocate the same size to all children.
  *)

  method set_spacing : int -> unit
  (** Sets how much spacing to put between children. *)

  method as_box_layout : Raw.Box_layout.t
end

(* High-level class for BoxLayout *)
class box_layout (obj : Raw.Box_layout.t) : box_layout_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .layout_manager
        (obj :> Raw.Layout_manager.t)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_baseline_child : unit -> int =
      fun () -> Raw.Box_layout.get_baseline_child obj

    method get_baseline_position : unit -> Enums.baselineposition =
      fun () -> Raw.Box_layout.get_baseline_position obj

    method get_homogeneous : unit -> bool =
      fun () -> Raw.Box_layout.get_homogeneous obj

    method get_spacing : unit -> int = fun () -> Raw.Box_layout.get_spacing obj

    method set_baseline_child : int -> unit =
      fun child -> Raw.Box_layout.set_baseline_child obj child

    method set_baseline_position : Enums.baselineposition -> unit =
      fun position -> Raw.Box_layout.set_baseline_position obj position

    method set_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Box_layout.set_homogeneous obj homogeneous

    method set_spacing : int -> unit =
      fun spacing -> Raw.Box_layout.set_spacing obj spacing

    method as_box_layout = obj
  end

let new_ (orientation : Enums.orientation) : box_layout_t =
  let obj_ = Raw.Box_layout.new_ orientation in
  new box_layout obj_
