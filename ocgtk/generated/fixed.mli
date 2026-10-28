(** Places its child widgets at fixed positions and with fixed sizes.

    [GtkFixed] performs no automatic layout management.

    For most applications, you should not use this container! It keeps you from
    having to learn about the other GTK containers, but it results in broken
    applications. With [GtkFixed], the following things will result in truncated
    text, overlapping widgets, and other display bugs:

    - Themes, which may change widget sizes.

    - Fonts other than the one you used to write the app will of course change
      the size of widgets containing text; keep in mind that users may use a
      larger font because of difficulty reading the default, or they may be
      using a different OS that provides different fonts.

    - Translation of text into other languages changes its size. Also, display
      of non-English text will use a different font in many cases.

    In addition, [GtkFixed] does not pay attention to text direction and thus
    may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately for the text direction, e.g. to put labels to the
    right of the thing they label when using an RTL language, but it can’t do
    that with [GtkFixed]. So if you need to reorder widgets depending on the
    text direction, you would need to manually detect it and adjust child
    positions accordingly.

    Finally, fixed positioning makes it kind of annoying to add/remove UI
    elements, since you have to reposition all the other elements. This is a
    long-term maintenance problem for your application.

    If you know none of these things are an issue for your application, and
    prefer the simplicity of [GtkFixed], by all means use the widget. But you
    should be aware of the tradeoffs.

    Its methods, signals and properties are on {!class-type-fixed_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Fixed}. *)

(** The methods, signals and properties of a [Fixed]. *)
class type fixed_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_child_transform :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgsk.Transform.transform_t option
  (** Retrieves the transformation for [widget] set using
      gtk_fixed_set_child_transform(). *)

  method move :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    float ->
    float ->
    unit
  (** Sets a translation transformation to the given [x] and [y] coordinates to
      the child [widget] of the [GtkFixed]. *)

  method put :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    float ->
    float ->
    unit
  (** Adds a widget to a [GtkFixed] at the given position. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child from [fixed]. *)

  method set_child_transform :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgsk.Transform.transform_t option ->
    unit
  (** Sets the transformation for [widget].

      This is a convenience function that retrieves the [Gtk.FixedLayoutChild]
      instance associated to [widget] and calls
      [Gtk.FixedLayoutChild.set_transform]. *)

  method as_fixed : Raw.Fixed.t
end

class fixed : Raw.Fixed.t -> fixed_t
(** Wraps a raw handle of {!Ocgtk.Raw.Fixed.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> fixed_t
(** Creates a new [GtkFixed]. *)
