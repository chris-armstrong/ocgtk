(* GENERATED CODE - DO NOT EDIT *)
(* Fixed: Fixed *)

type t = [ `fixed | `widget | `initially_unowned | `object_ ] Gobject.obj
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
    should be aware of the tradeoffs. *)

external new_ : unit -> t = "ml_gtk_fixed_new"
(** Create a new Fixed *)

(* Methods *)

external set_child_transform :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Ocgtk_gsk.Gsk.Wrappers.Transform.t option ->
  unit = "ml_gtk_fixed_set_child_transform"
(** Sets the transformation for [widget].

    This is a convenience function that retrieves the [Gtk.FixedLayoutChild]
    instance associated to [widget] and calls
    [Gtk.FixedLayoutChild.set_transform]. *)

external remove :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_fixed_remove"
(** Removes a child from [fixed]. *)

external put :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  float ->
  float ->
  unit = "ml_gtk_fixed_put"
(** Adds a widget to a [GtkFixed] at the given position. *)

external move :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  float ->
  float ->
  unit = "ml_gtk_fixed_move"
(** Sets a translation transformation to the given [x] and [y] coordinates to
    the child [widget] of the [GtkFixed]. *)

external get_child_transform :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Ocgtk_gsk.Gsk.Wrappers.Transform.t option = "ml_gtk_fixed_get_child_transform"
(** Retrieves the transformation for [widget] set using
    gtk_fixed_set_child_transform(). *)

external get_child_position :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  float * float = "ml_gtk_fixed_get_child_position"
(** Retrieves the translation transformation of the given child [GtkWidget] in
    the [GtkFixed].

    See also: [Gtk.Fixed.get_child_transform]. *)
