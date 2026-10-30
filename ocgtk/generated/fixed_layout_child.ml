class type fixed_layout_child_t = object
  inherit Layout_child.layout_child_t

  (** {2:methods Methods} *)

  method get_transform : unit -> Ocgsk.Transform.transform_t option
  (** Retrieves the transformation of the child. *)

  method set_transform : Ocgsk.Transform.transform_t -> unit
  (** Sets the transformation of the child of a [GtkFixedLayout]. *)

  (** {2:conversions Conversions} *)

  method as_fixed_layout_child : Raw.Fixed_layout_child.t
end

(* High-level class for FixedLayoutChild *)
class fixed_layout_child (obj : Raw.Fixed_layout_child.t) : fixed_layout_child_t
  =
  object (self)
    inherit Layout_child.layout_child (obj :> Raw.Layout_child.t)

    method get_transform : unit -> Ocgsk.Transform.transform_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgsk.Transform.transform ret)
          (Raw.Fixed_layout_child.get_transform obj)

    method set_transform : Ocgsk.Transform.transform_t -> unit =
      fun transform ->
        let transform = transform#as_transform in
        Raw.Fixed_layout_child.set_transform obj transform

    method as_fixed_layout_child = obj
  end
