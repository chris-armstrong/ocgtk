class type scrollable_t = object
  method get_hadjustment : unit -> Adjustment.adjustment_t option
  method get_hscroll_policy : unit -> Enums.scrollablepolicy
  method get_vadjustment : unit -> Adjustment.adjustment_t option
  method get_vscroll_policy : unit -> Enums.scrollablepolicy
  method set_hadjustment : Adjustment.adjustment_t option -> unit
  method set_hscroll_policy : Enums.scrollablepolicy -> unit
  method set_vadjustment : Adjustment.adjustment_t option -> unit
  method set_vscroll_policy : Enums.scrollablepolicy -> unit
  method as_scrollable : Raw.Scrollable.t
end

(* High-level class for Scrollable *)
class scrollable (obj : Raw.Scrollable.t) : scrollable_t =
  object (self)
    method get_hadjustment : unit -> Adjustment.adjustment_t option =
      fun () ->
        Option.map
          (fun ret -> new Adjustment.adjustment ret)
          (Raw.Scrollable.get_hadjustment obj)

    method get_hscroll_policy : unit -> Enums.scrollablepolicy =
      fun () -> Raw.Scrollable.get_hscroll_policy obj

    method get_vadjustment : unit -> Adjustment.adjustment_t option =
      fun () ->
        Option.map
          (fun ret -> new Adjustment.adjustment ret)
          (Raw.Scrollable.get_vadjustment obj)

    method get_vscroll_policy : unit -> Enums.scrollablepolicy =
      fun () -> Raw.Scrollable.get_vscroll_policy obj

    method set_hadjustment : Adjustment.adjustment_t option -> unit =
      fun hadjustment ->
        let hadjustment = Option.map (fun c -> c#as_adjustment) hadjustment in
        Raw.Scrollable.set_hadjustment obj hadjustment

    method set_hscroll_policy : Enums.scrollablepolicy -> unit =
      fun policy -> Raw.Scrollable.set_hscroll_policy obj policy

    method set_vadjustment : Adjustment.adjustment_t option -> unit =
      fun vadjustment ->
        let vadjustment = Option.map (fun c -> c#as_adjustment) vadjustment in
        Raw.Scrollable.set_vadjustment obj vadjustment

    method set_vscroll_policy : Enums.scrollablepolicy -> unit =
      fun policy -> Raw.Scrollable.set_vscroll_policy obj policy

    method as_scrollable = obj
  end
