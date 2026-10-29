(** Shows a horizontal or vertical scrollbar.

    Its methods, signals and properties are on {!class-type-scrollbar_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Scrollbar}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Scrollbar].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Accessible_range.class-type-accessible_range_t}Ocgtk.Accessible_range}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Shows a horizontal or vertical scrollbar.

    An example GtkScrollbar

    Its position and movement are controlled by the adjustment that is passed to
    or created by {{!Ocgtk.Scrollbar.val-new_}[Gtk.Scrollbar.new]}. See
    {{!Ocgtk.Adjustment.class-type-adjustment_t}[Gtk.Adjustment]} for more
    details. The
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_value}[Gtk.Adjustment:value]}
    field sets the position of the thumb and must be between
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_lower}[Gtk.Adjustment:lower]}
    and
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_upper}[Gtk.Adjustment:upper]}
    \-
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_page_size}[Gtk.Adjustment:page-size]}.
    The
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_page_size}[Gtk.Adjustment:page-size]}
    represents the size of the visible scrollable area.

    The fields
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_step_increment}[Gtk.Adjustment:step-increment]}
    and
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_page_increment}[Gtk.Adjustment:page-increment]}
    fields are added to or subtracted from the
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_value}[Gtk.Adjustment:value]}
    when the user asks to move by a step (using e.g. the cursor arrow keys) or
    by a page (using e.g. the Page Down/Up keys).

    {b CSS nodes}

    {[
    scrollbar
    ╰── range[.fine-tune]
        ╰── trough
            ╰── slider
    ]}

    [GtkScrollbar] has a main CSS node with name scrollbar and a subnode for its
    contents. The main node gets the .horizontal or .vertical style classes
    applied, depending on the scrollbar's orientation.

    The range node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.

    Other style classes that may be added to scrollbars inside
    {{!Ocgtk.Scrolled_window.class-type-scrolled_window_t}[Gtk.ScrolledWindow]}
    include the positional classes (.left, .right, .top, .bottom) and style
    classes related to overlay scrolling (.overlay-indicator, .dragging,
    .hovering).

    {b Accessibility}

    [GtkScrollbar] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-SCROLLBAR}[Gtk.AccessibleRole.scrollbar]}
    role. *)
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

class scrollbar : Raw.Scrollbar.t -> scrollbar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Scrollbar.t}. *)

(** {1:description Description}

    Shows a horizontal or vertical scrollbar.

    An example GtkScrollbar

    Its position and movement are controlled by the adjustment that is passed to
    or created by {{!Ocgtk.Scrollbar.val-new_}[Gtk.Scrollbar.new]}. See
    {{!Ocgtk.Adjustment.class-type-adjustment_t}[Gtk.Adjustment]} for more
    details. The
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_value}[Gtk.Adjustment:value]}
    field sets the position of the thumb and must be between
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_lower}[Gtk.Adjustment:lower]}
    and
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_upper}[Gtk.Adjustment:upper]}
    \-
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_page_size}[Gtk.Adjustment:page-size]}.
    The
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_page_size}[Gtk.Adjustment:page-size]}
    represents the size of the visible scrollable area.

    The fields
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_step_increment}[Gtk.Adjustment:step-increment]}
    and
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_page_increment}[Gtk.Adjustment:page-increment]}
    fields are added to or subtracted from the
    {{!Ocgtk.Adjustment.class-type-adjustment_t.method-get_value}[Gtk.Adjustment:value]}
    when the user asks to move by a step (using e.g. the cursor arrow keys) or
    by a page (using e.g. the Page Down/Up keys).

    {b CSS nodes}

    {[
    scrollbar
    ╰── range[.fine-tune]
        ╰── trough
            ╰── slider
    ]}

    [GtkScrollbar] has a main CSS node with name scrollbar and a subnode for its
    contents. The main node gets the .horizontal or .vertical style classes
    applied, depending on the scrollbar's orientation.

    The range node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.

    Other style classes that may be added to scrollbars inside
    {{!Ocgtk.Scrolled_window.class-type-scrolled_window_t}[Gtk.ScrolledWindow]}
    include the positional classes (.left, .right, .top, .bottom) and style
    classes related to overlay scrolling (.overlay-indicator, .dragging,
    .hovering).

    {b Accessibility}

    [GtkScrollbar] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-SCROLLBAR}[Gtk.AccessibleRole.scrollbar]}
    role. *)

(** {1:constructors Constructors} *)

val new_ : Enums.orientation -> Adjustment.adjustment_t option -> scrollbar_t
(** Creates a new scrollbar with the given orientation. *)
