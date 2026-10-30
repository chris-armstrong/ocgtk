(** Manages up to three children.

    Its methods, signals and properties are on {!class-type-center_layout_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Center_layout}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CenterLayout].}

    Inherits from:
    {{!Ocgtk.Layout_manager.class-type-layout_manager_t}Ocgtk.Layout_manager}

    Manages up to three children.

    The start widget is allocated at the start of the layout (left in
    left-to-right locales and right in right-to-left ones), and the end widget
    at the end.

    The center widget is centered regarding the full width of the layout's. *)
class type center_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:methods Methods} *)

  method get_baseline_position : unit -> Enums.baselineposition
  (** Returns the baseline position of the layout. *)

  method get_center_widget : unit -> Widget.widget_t option
  (** Returns the center widget of the layout. *)

  method get_end_widget : unit -> Widget.widget_t option
  (** Returns the end widget of the layout. *)

  method get_orientation : unit -> Enums.orientation
  (** Gets the current orienration of the layout manager. *)

  method get_shrink_center_last : unit -> bool
  (** Gets whether [self] shrinks the center widget after other children. *)

  method get_start_widget : unit -> Widget.widget_t option
  (** Returns the start widget of the layout. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the new baseline position of [self] *)

  method set_center_widget : Widget.widget_t option -> unit
  (** Sets the new center widget of [self].

      To remove the existing center widget, pass [None]. *)

  method set_end_widget : Widget.widget_t option -> unit
  (** Sets the new end widget of [self].

      To remove the existing center widget, pass [None]. *)

  method set_orientation : Enums.orientation -> unit
  (** Sets the orientation of [self]. *)

  method set_shrink_center_last : bool -> unit
  (** Sets whether to shrink the center widget after other children.

      By default, when there's no space to give all three children their natural
      widths, the start and end widgets start shrinking and the center child
      keeps natural width until they reach minimum width.

      If set to [false], start and end widgets keep natural width and the center
      widget starts shrinking instead. *)

  method set_start_widget : Widget.widget_t option -> unit
  (** Sets the new start widget of [self].

      To remove the existing start widget, pass [None]. *)

  (** {2:conversions Conversions} *)

  method as_center_layout : Raw.Center_layout.t
end

class center_layout : Raw.Center_layout.t -> center_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Center_layout.t}. *)

(** {1:description Description}

    Manages up to three children.

    The start widget is allocated at the start of the layout (left in
    left-to-right locales and right in right-to-left ones), and the end widget
    at the end.

    The center widget is centered regarding the full width of the layout's. *)

(** {1:constructors Constructors} *)

val new_ : unit -> center_layout_t
(** Creates a new [GtkCenterLayout]. *)
