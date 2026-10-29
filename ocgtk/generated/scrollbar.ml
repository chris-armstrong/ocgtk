class type scrollbar_t = object
  inherit Widget.widget_t
  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_adjustment : unit -> Adjustment.adjustment_t
  (** Returns the scrollbar's adjustment. *)

  method set_adjustment : Adjustment.adjustment_t option -> unit
  (** Makes the scrollbar use the given adjustment. *)

  (** {2:conversions Conversions} *)

  method as_scrollbar : Raw.Scrollbar.t
end

(* High-level class for Scrollbar *)
class scrollbar (obj : Raw.Scrollbar.t) : scrollbar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_adjustment : unit -> Adjustment.adjustment_t =
      fun () -> new Adjustment.adjustment (Raw.Scrollbar.get_adjustment obj)

    method set_adjustment : Adjustment.adjustment_t option -> unit =
      fun adjustment ->
        let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
        Raw.Scrollbar.set_adjustment obj adjustment

    method as_scrollbar = obj
  end

let new_ (orientation : Enums.orientation)
    (adjustment : Adjustment.adjustment_t option) : scrollbar_t =
  let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
  let obj_ = Raw.Scrollbar.new_ orientation adjustment in
  new scrollbar obj_
