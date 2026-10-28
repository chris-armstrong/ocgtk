class type frame_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [frame]. *)

  method get_label : unit -> string option
  (** Returns the frame labels text.

      If the frame's label widget is not a [GtkLabel], [NULL] is returned. *)

  method get_label_align : unit -> float
  (** Retrieves the X alignment of the frame’s label. *)

  method get_label_widget : unit -> Widget.widget_t option
  (** Retrieves the label widget for the frame. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [frame]. *)

  method set_label : string option -> unit
  (** Creates a new [GtkLabel] with the [label] and sets it as the frame's label
      widget. *)

  method set_label_align : float -> unit
  (** Sets the X alignment of the frame widget’s label.

      The default value for a newly created frame is 0.0. *)

  method set_label_widget : Widget.widget_t option -> unit
  (** Sets the label widget for the frame.

      This is the widget that will appear embedded in the top edge of the frame
      as a title. *)

  (** {2:conversions Conversions} *)

  method as_frame : Raw.Frame.t
end

(* High-level class for Frame *)
class frame (obj : Raw.Frame.t) : frame_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map (fun ret -> new Widget.widget ret) (Raw.Frame.get_child obj)

    method get_label : unit -> string option = fun () -> Raw.Frame.get_label obj

    method get_label_align : unit -> float =
      fun () -> Raw.Frame.get_label_align obj

    method get_label_widget : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Frame.get_label_widget obj)

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Frame.set_child obj child

    method set_label : string option -> unit =
      fun label -> Raw.Frame.set_label obj label

    method set_label_align : float -> unit =
      fun xalign -> Raw.Frame.set_label_align obj xalign

    method set_label_widget : Widget.widget_t option -> unit =
      fun label_widget ->
        let label_widget = Option.map (fun c -> c#as_widget) label_widget in
        Raw.Frame.set_label_widget obj label_widget

    method as_frame = obj
  end

let new_ (label : string option) : frame_t =
  let obj_ = Raw.Frame.new_ label in
  new frame obj_
