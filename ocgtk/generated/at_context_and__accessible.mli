(** The classes of {!Ocgtk.At_context}, {!Ocgtk.Accessible}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** {b The methods, signals and properties of a [ATContext].}

    Communicates with platform-specific assistive technologies API.

    Each platform supported by GTK implements a [GtkATContext] subclass, and is
    responsible for updating the accessible state in response to state changes
    in [GtkAccessible]. *)
class type at_context_t = object
  (** {2:signals Signals} *)

  method on_state_change :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the attributes of the accessible for the [GtkATContext]
      instance change. *)

  (** {2:methods Methods} *)

  method get_accessible : unit -> accessible_t
  (** Retrieves the [GtkAccessible] using this context. *)

  method get_accessible_role : unit -> Enums.accessiblerole
  (** Retrieves the accessible role of this context. *)

  (** {2:properties Properties} *)

  method display : Ocgdk.Display.display_t
  (** The [GdkDisplay] for the [GtkATContext]. *)

  method set_display : Ocgdk.Display.display_t -> unit
  (** The [GdkDisplay] for the [GtkATContext]. *)

  (** {2:conversions Conversions} *)

  method as_at_context : Raw.At_context.t
end

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
    [GtkWidget] visibility changes, the [GTK_ACCESSIBLE_STATE_HIDDEN] state will
    also change to reflect the
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
and accessible_t = object
  (** {2:methods Methods} *)

  method announce : string -> Enums.accessibleannouncementpriority -> unit
  (** Requests the user's screen reader to announce the given message.

      This kind of notification is useful for messages that either have only a
      visual representation or that are not exposed visually at all, e.g. a
      notification about a successful operation.

      Also, by using this API, you can ensure that the message does not
      interrupts the user's current screen reader output. *)

  method get_accessible_parent : unit -> accessible_t option
  (** Retrieves the accessible parent for an accessible object.

      This function returns [None] for top level widgets. *)

  method get_accessible_role : unit -> Enums.accessiblerole
  (** Retrieves the accessible role of an accessible object. *)

  method get_at_context : unit -> at_context_t
  (** Retrieves the implementation for the given accessible object. *)

  method get_first_accessible_child : unit -> accessible_t option
  (** Retrieves the first accessible child of an accessible object. *)

  method get_next_accessible_sibling : unit -> accessible_t option
  (** Retrieves the next accessible sibling of an accessible object *)

  method get_platform_state : Enums.accessibleplatformstate -> bool
  (** Queries a platform state, such as focus.

      This functionality can be overridden by [GtkAccessible] implementations,
      e.g. to get platform state from an ignored child widget, as is the case
      for [GtkText] wrappers. *)

  method reset_property : Enums.accessibleproperty -> unit
  (** Resets the accessible property to its default value. *)

  method reset_relation : Enums.accessiblerelation -> unit
  (** Resets the accessible relation to its default value. *)

  method reset_state : Enums.accessiblestate -> unit
  (** Resets the accessible state to its default value. *)

  method set_accessible_parent :
    accessible_t option -> accessible_t option -> unit
  (** Sets the parent and sibling of an accessible object.

      This function is meant to be used by accessible implementations that are
      not part of the widget hierarchy, and but act as a logical bridge between
      widgets. For instance, if a widget creates an object that holds metadata
      for each child, and you want that object to implement the [GtkAccessible]
      interface, you will use this function to ensure that the parent of each
      child widget is the metadata object, and the parent of each metadata
      object is the container widget. *)

  method update_next_accessible_sibling : accessible_t option -> unit
  (** Updates the next accessible sibling.

      That might be useful when a new child of a custom accessible is created,
      and it needs to be linked to a previous child. *)

  method update_platform_state : Enums.accessibleplatformstate -> unit
  (** Informs ATs that the platform state has changed.

      This function should be used by [GtkAccessible] implementations that have
      a platform state but are not widgets. Widgets handle platform states
      automatically. *)

  (** {2:conversions Conversions} *)

  method as_accessible : Raw.Accessible.t
end

(** Wraps a raw handle of {!Ocgtk.Raw.At_context.t}. *)
class at_context : Raw.At_context.t -> at_context_t
(** Wraps a raw handle of {!Ocgtk.Raw.Accessible.t}. *)

and accessible : Raw.Accessible.t -> accessible_t

val create :
  Enums.accessiblerole ->
  accessible_t ->
  Ocgdk.Display.display_t ->
  at_context_t
(** Creates a new [GtkATContext] instance for the given accessible role,
    accessible instance, and display connection.

    The [GtkATContext] implementation being instantiated will depend on the
    platform. *)
