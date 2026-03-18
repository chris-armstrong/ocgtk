(* High-level class for FixedLayoutChild *)
class fixed_layout_child (obj : Fixed_layout_child.t) = object (self)

  method get_transform : unit -> Ocgtk_gsk.Gsk.transform option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.transform ret) (Fixed_layout_child.get_transform obj)

  method set_transform : 'p1. (#Ocgtk_gsk.Gsk.transform as 'p1) -> unit =
    fun transform ->
      let transform = transform#as_transform in
      (Fixed_layout_child.set_transform obj transform)

    method as_fixed_layout_child = obj
end

