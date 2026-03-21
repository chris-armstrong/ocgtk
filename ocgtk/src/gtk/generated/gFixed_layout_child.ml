class type fixed_layout_child_t = object
    method get_transform : unit -> Ocgtk_gsk.Gsk.transform_t option
    method set_transform : Ocgtk_gsk.Gsk.transform_t -> unit
    method as_fixed_layout_child : Fixed_layout_child.t
end

(* High-level class for FixedLayoutChild *)
class fixed_layout_child (obj : Fixed_layout_child.t) : fixed_layout_child_t = object (self)

  method get_transform : unit -> Ocgtk_gsk.Gsk.transform_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.transform ret) (Fixed_layout_child.get_transform obj)

  method set_transform : Ocgtk_gsk.Gsk.transform_t -> unit =
    fun transform ->
      let transform = transform#as_transform in
      (Fixed_layout_child.set_transform obj transform)

    method as_fixed_layout_child = obj
end

