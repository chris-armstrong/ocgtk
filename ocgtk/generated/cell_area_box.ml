class type cell_area_box_t = object
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_area_t
  inherit Orientable.orientable_t

  method get_spacing : unit -> int
  (** Gets the spacing added between cell renderers. *)

  method set_spacing : int -> unit
  (** Sets the spacing to add between cell renderers in [box]. *)

  method as_cell_area_box : Raw.Cell_area_box.t
end

(* High-level class for CellAreaBox *)
class cell_area_box (obj : Raw.Cell_area_box.t) : cell_area_box_t =
  object (self)
    inherit
      Cell_area_and__cell_area_context_and__cell_layout.cell_area
        (obj :> Raw.Cell_area.t)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_spacing : unit -> int =
      fun () -> Raw.Cell_area_box.get_spacing obj

    method set_spacing : int -> unit =
      fun spacing -> Raw.Cell_area_box.set_spacing obj spacing

    method as_cell_area_box = obj
  end

let new_ () : cell_area_box_t = new cell_area_box (Raw.Cell_area_box.new_ ())
