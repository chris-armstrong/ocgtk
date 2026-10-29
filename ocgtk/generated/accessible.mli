(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Accessible from cyclic group At_context_and__accessible *)

(** An interface for describing UI elements for Assistive Technologies.

    Its methods, signals and properties are on {!class-type-accessible_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Accessible}. *)

(** {1:class Class} *)

class type accessible_t = At_context_and__accessible.accessible_t
(** {b The methods, signals and properties of a [Accessible].}

    An interface for describing UI elements for Assistive Technologies.

    Every accessible implementation has:

    - a “role”, represented by a value of the
      {{!Ocgtk.Enums.type-accessiblerole}[Gtk.AccessibleRole]} enumeration
    - “attributes”, represented by a set of
      {{!Ocgtk.Enums.type-accessiblestate}[Gtk.AccessibleState]},
      {{!Ocgtk.Enums.type-accessibleproperty}[Gtk.AccessibleProperty]} and
      {{!Ocgtk.Enums.type-accessiblerelation}[Gtk.AccessibleRelation]} values

    The role cannot be changed after instantiating a [GtkAccessible]
    implementation.

    The attributes are updated every time a UI element's state changes in a way
    that should be reflected by assistive technologies. For instance, if a
    [GtkWidget] visibility changes, the
    {{!Ocgtk.Enums.type-accessiblestate.constructor-HIDDEN}[GTK_ACCESSIBLE_STATE_HIDDEN]}
    state will also change to reflect the
    {{!Ocgtk.Widget.class-type-widget_t.method-get_visible}[Gtk.Widget:visible]}
    property.

    Every accessible implementation is part of a tree of accessible objects.
    Normally, this tree corresponds to the widget tree, but can be customized by
    reimplementing the [Gtk.Accessible.get_accessible_parent],
    [Gtk.Accessible.get_first_accessible_child] and
    [Gtk.Accessible.get_next_accessible_sibling] virtual functions.

    Note that you can not create a top-level accessible object as of now, which
    means that you must always have a parent accessible object.

    Also note that when an accessible object does not correspond to a widget,
    and it has children, whose implementation you don't control, it is necessary
    to ensure the correct shape of the a11y tree by calling
    {{!Ocgtk.Accessible.class-type-accessible_t.method-set_accessible_parent}[Gtk.Accessible.set_accessible_parent]}
    and updating the sibling by
    {{!Ocgtk.Accessible.class-type-accessible_t.method-update_next_accessible_sibling}
     [Gtk.Accessible.update_next_accessible_sibling]}. *)

class accessible : Raw.Accessible.t -> accessible_t
(** Wraps a raw handle of {!Ocgtk.Raw.Accessible.t}. *)

(** {1:description Description}

    An interface for describing UI elements for Assistive Technologies.

    Every accessible implementation has:

    - a “role”, represented by a value of the
      {{!Ocgtk.Enums.type-accessiblerole}[Gtk.AccessibleRole]} enumeration
    - “attributes”, represented by a set of
      {{!Ocgtk.Enums.type-accessiblestate}[Gtk.AccessibleState]},
      {{!Ocgtk.Enums.type-accessibleproperty}[Gtk.AccessibleProperty]} and
      {{!Ocgtk.Enums.type-accessiblerelation}[Gtk.AccessibleRelation]} values

    The role cannot be changed after instantiating a [GtkAccessible]
    implementation.

    The attributes are updated every time a UI element's state changes in a way
    that should be reflected by assistive technologies. For instance, if a
    [GtkWidget] visibility changes, the
    {{!Ocgtk.Enums.type-accessiblestate.constructor-HIDDEN}[GTK_ACCESSIBLE_STATE_HIDDEN]}
    state will also change to reflect the
    {{!Ocgtk.Widget.class-type-widget_t.method-get_visible}[Gtk.Widget:visible]}
    property.

    Every accessible implementation is part of a tree of accessible objects.
    Normally, this tree corresponds to the widget tree, but can be customized by
    reimplementing the [Gtk.Accessible.get_accessible_parent],
    [Gtk.Accessible.get_first_accessible_child] and
    [Gtk.Accessible.get_next_accessible_sibling] virtual functions.

    Note that you can not create a top-level accessible object as of now, which
    means that you must always have a parent accessible object.

    Also note that when an accessible object does not correspond to a widget,
    and it has children, whose implementation you don't control, it is necessary
    to ensure the correct shape of the a11y tree by calling
    {{!Ocgtk.Accessible.class-type-accessible_t.method-set_accessible_parent}[Gtk.Accessible.set_accessible_parent]}
    and updating the sibling by
    {{!Ocgtk.Accessible.class-type-accessible_t.method-update_next_accessible_sibling}
     [Gtk.Accessible.update_next_accessible_sibling]}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
