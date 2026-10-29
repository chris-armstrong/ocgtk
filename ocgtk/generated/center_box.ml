class type center_box_t = object
  inherit Widget.widget_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_baseline_position : unit -> Enums.baselineposition
  (** Gets the baseline position of the center box.

      See [Gtk.CenterBox.set_baseline_position]. *)

  method get_center_widget : unit -> Widget.widget_t option
  (** Gets the center widget. *)

  method get_end_widget : unit -> Widget.widget_t option
  (** Gets the end widget. *)

  method get_shrink_center_last : unit -> bool
  (** Gets whether the center widget shrinks after other children. *)

  method get_start_widget : unit -> Widget.widget_t option
  (** Gets the start widget. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the baseline position of a center box.

      This affects only horizontal boxes with at least one baseline aligned
      child. If there is more vertical space available than requested, and the
      baseline is not allocated by the parent then [position] is used to
      allocate the baseline with respect to the extra space available. *)

  method set_center_widget : Widget.widget_t option -> unit
  (** Sets the center widget.

      To remove the existing center widget, pass [NULL]. *)

  method set_end_widget : Widget.widget_t option -> unit
  (** Sets the end widget.

      To remove the existing end widget, pass [NULL]. *)

  method set_shrink_center_last : bool -> unit
  (** Sets whether to shrink the center widget after other children.

      By default, when there's no space to give all three children their natural
      widths, the start and end widgets start shrinking and the center child
      keeps natural width until they reach minimum width.

      If [shrink_center_last] is false, start and end widgets keep natural width
      and the center widget starts shrinking instead. *)

  method set_start_widget : Widget.widget_t option -> unit
  (** Sets the start widget.

      To remove the existing start widget, pass [NULL]. *)

  (** {2:conversions Conversions} *)

  method as_center_box : Raw.Center_box.t
end

(* High-level class for CenterBox *)
class center_box (obj : Raw.Center_box.t) : center_box_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_baseline_position : unit -> Enums.baselineposition =
      fun () -> Raw.Center_box.get_baseline_position obj

    method get_center_widget : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Center_box.get_center_widget obj)

    method get_end_widget : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Center_box.get_end_widget obj)

    method get_shrink_center_last : unit -> bool =
      fun () -> Raw.Center_box.get_shrink_center_last obj

    method get_start_widget : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Center_box.get_start_widget obj)

    method set_baseline_position : Enums.baselineposition -> unit =
      fun position -> Raw.Center_box.set_baseline_position obj position

    method set_center_widget : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Center_box.set_center_widget obj child

    method set_end_widget : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Center_box.set_end_widget obj child

    method set_shrink_center_last : bool -> unit =
      fun shrink_center_last ->
        Raw.Center_box.set_shrink_center_last obj shrink_center_last

    method set_start_widget : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Center_box.set_start_widget obj child

    method as_center_box = obj
  end

let new_ () : center_box_t = new center_box (Raw.Center_box.new_ ())
