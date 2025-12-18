(* GENERATED CODE - DO NOT EDIT *)
(* WidgetClass: WidgetClass *)

type t = [`widget_class] Gobject.obj

(** For use in language bindings, this will override the default
`GtkBuilderScope` to be used when parsing GtkBuilder XML from
this class’s template data.

Note that this must be called from a composite widget classes class
initializer after calling [method@Gtk.WidgetClass.set_template]. *)
external set_template_scope : t -> Builder_scope.t -> unit = "ml_gtk_widget_class_set_template_scope"

(** A convenience function that calls [method@Gtk.WidgetClass.set_template]
with the contents of a `GResource`.

Note that any class that installs templates must call
[method@Gtk.Widget.init_template] in the widget’s instance
initializer. *)
external set_template_from_resource : t -> string -> unit = "ml_gtk_widget_class_set_template_from_resource"

(** Sets the name to be used for CSS matching of widgets.

If this function is not called for a given class, the name
set on the parent class is used. By default, `GtkWidget`
uses the name "widget". *)
external set_css_name : t -> string -> unit = "ml_gtk_widget_class_set_css_name"

(** Sets the `GtkWidgetClass.activate_signal` field with the signal id for
the given @signal_name.

The signal will be emitted when calling [method@Gtk.Widget.activate].

The @signal_name of @widget_type must have been registered with
g_signal_new() or g_signal_newv() before calling this function. *)
external set_activate_signal_from_name : t -> string -> unit = "ml_gtk_widget_class_set_activate_signal_from_name"

(** Sets the `GtkWidgetClass.activate_signal` field with the
given @signal_id.

The signal will be emitted when calling [method@Gtk.Widget.activate].

The @signal_id must have been registered with `g_signal_new()`
or g_signal_newv() before calling this function. *)
external set_activate_signal : t -> int -> unit = "ml_gtk_widget_class_set_activate_signal"

(** Sets the accessible role used by the given `GtkWidget` class.

Different accessible roles have different states, and are
rendered differently by assistive technologies. *)
external set_accessible_role : t -> Gtk_enums.accessiblerole -> unit = "ml_gtk_widget_class_set_accessible_role"

(** Installs an action called @action_name on @widget_class and
binds its state to the value of the @property_name property.

This function will perform a few sanity checks on the property selected
via @property_name. Namely, the property must exist, must be readable,
writable and must not be construct-only. There are also restrictions
on the type of the given property, it must be boolean, int, unsigned int,
double or string. If any of these conditions are not met, a critical
warning will be printed and no action will be added.

The state type of the action matches the property type.

If the property is boolean, the action will have no parameter and
toggle the property value. Otherwise, the action will have a parameter
of the same type as the property. *)
external install_property_action : t -> string -> string -> unit = "ml_gtk_widget_class_install_property_action"

(** Gets the name used by this class for matching in CSS code.

See [method@Gtk.WidgetClass.set_css_name] for details. *)
external get_css_name : t -> string = "ml_gtk_widget_class_get_css_name"

(** Retrieves the signal id for the activation signal.

the activation signal is set using
[method@Gtk.WidgetClass.set_activate_signal]. *)
external get_activate_signal : t -> int = "ml_gtk_widget_class_get_activate_signal"

(** Retrieves the accessible role used by the given `GtkWidget` class.

Different accessible roles have different states, and are rendered
differently by assistive technologies.

See also: [method@Gtk.Accessible.get_accessible_role]. *)
external get_accessible_role : t -> Gtk_enums.accessiblerole = "ml_gtk_widget_class_get_accessible_role"

(** Installs a shortcut in @widget_class.

Every instance created for @widget_class or its subclasses will
inherit this shortcut and trigger it.

Shortcuts added this way will be triggered in the %GTK_PHASE_BUBBLE
phase, which means they may also trigger if child widgets have focus.

This function must only be used in class initialization functions
otherwise it is not guaranteed that the shortcut will be installed. *)
external add_shortcut : t -> Shortcut.t -> unit = "ml_gtk_widget_class_add_shortcut"

