class type scrollable_t = object
  (** {2:methods Methods} *)

  method get_hadjustment : unit -> Adjustment.adjustment_t option
  (** Retrieves the [GtkAdjustment] used for horizontal scrolling. *)

  method get_hscroll_policy : unit -> Enums.scrollablepolicy
  (** Gets the horizontal [GtkScrollablePolicy]. *)

  method get_vadjustment : unit -> Adjustment.adjustment_t option
  (** Retrieves the [GtkAdjustment] used for vertical scrolling. *)

  method get_vscroll_policy : unit -> Enums.scrollablepolicy
  (** Gets the vertical [GtkScrollablePolicy]. *)

  method set_hadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the horizontal adjustment of the [GtkScrollable]. *)

  method set_hscroll_policy : Enums.scrollablepolicy -> unit
  (** Sets the [GtkScrollablePolicy].

      The policy determines whether horizontal scrolling should start below the
      minimum width or below the natural width. *)

  method set_vadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the vertical adjustment of the [GtkScrollable]. *)

  method set_vscroll_policy : Enums.scrollablepolicy -> unit
  (** Sets the [GtkScrollablePolicy].

      The policy determines whether vertical scrolling should start below the
      minimum height or below the natural height. *)

  (** {2:conversions Conversions} *)

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
