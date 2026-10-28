(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

(** The layer 1 modules of {!Ocgtk.Raw.At_context}, {!Ocgtk.Raw.Accessible},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** Communicates with platform-specific assistive technologies API.

    Each platform supported by GTK implements a [GtkATContext] subclass, and is
    responsible for updating the accessible state in response to state changes
    in [GtkAccessible].

    The class built on this module is in {!Ocgtk.At_context}. *)
module rec At_context : sig
  type t = [ `at_context | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_at_context_get_type"

  external create :
    Ocgtk_enums.accessiblerole -> Accessible.t -> Ocgdk_raw.Display.t -> t
    = "ml_gtk_at_context_create"
  (** Creates a new [GtkATContext] instance for the given accessible role,
      accessible instance, and display connection.

      The [GtkATContext] implementation being instantiated will depend on the
      platform. *)

  (* Methods *)

  external get_accessible_role : t -> Ocgtk_enums.accessiblerole
    = "ml_gtk_at_context_get_accessible_role"
  (** Retrieves the accessible role of this context. *)

  external get_accessible : t -> Accessible.t
    = "ml_gtk_at_context_get_accessible"
  (** Retrieves the [GtkAccessible] using this context. *)

  (* Properties *)

  external get_display : t -> Ocgdk_raw.Display.t
    = "ml_gtk_at_context_get_display"
  (** Get property: display *)

  external set_display : t -> Ocgdk_raw.Display.t -> unit
    = "ml_gtk_at_context_set_display"
  (** Set property: display *)

  val on_state_change :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
  (** Emitted when the attributes of the accessible for the [GtkATContext]
      instance change. *)
end

(** An interface for describing UI elements for Assistive Technologies.

    Every accessible implementation has:

    - a “role”, represented by a value of the [Gtk.AccessibleRole] enumeration
    - “attributes”, represented by a set of [Gtk.AccessibleState],
      [Gtk.AccessibleProperty] and [Gtk.AccessibleRelation] values

    The role cannot be changed after instantiating a [GtkAccessible]
    implementation.

    The attributes are updated every time a UI element's state changes in a way
    that should be reflected by assistive technologies. For instance, if a
    [GtkWidget] visibility changes, the [GTK_ACCESSIBLE_STATE_HIDDEN] state will
    also change to reflect the [Gtk.Widget:visible] property.

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
    [Gtk.Accessible.set_accessible_parent] and updating the sibling by
    [Gtk.Accessible.update_next_accessible_sibling].

    The class built on this module is in {!Ocgtk.Accessible}. *)
and Accessible : sig
  type t = [ `accessible ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_accessible_get_type"
  external from_gobject : 'a Gobject.obj -> t = "ml_gtk_accessible_from_gobject"

  (* Methods *)

  external update_platform_state :
    t -> Ocgtk_enums.accessibleplatformstate -> unit
    = "ml_gtk_accessible_update_platform_state"
  (** Informs ATs that the platform state has changed.

      This function should be used by [GtkAccessible] implementations that have
      a platform state but are not widgets. Widgets handle platform states
      automatically. *)

  external update_next_accessible_sibling : t -> t option -> unit
    = "ml_gtk_accessible_update_next_accessible_sibling"
  (** Updates the next accessible sibling.

      That might be useful when a new child of a custom accessible is created,
      and it needs to be linked to a previous child. *)

  external set_accessible_parent : t -> t option -> t option -> unit
    = "ml_gtk_accessible_set_accessible_parent"
  (** Sets the parent and sibling of an accessible object.

      This function is meant to be used by accessible implementations that are
      not part of the widget hierarchy, and but act as a logical bridge between
      widgets. For instance, if a widget creates an object that holds metadata
      for each child, and you want that object to implement the [GtkAccessible]
      interface, you will use this function to ensure that the parent of each
      child widget is the metadata object, and the parent of each metadata
      object is the container widget. *)

  external reset_state : t -> Ocgtk_enums.accessiblestate -> unit
    = "ml_gtk_accessible_reset_state"
  (** Resets the accessible state to its default value. *)

  external reset_relation : t -> Ocgtk_enums.accessiblerelation -> unit
    = "ml_gtk_accessible_reset_relation"
  (** Resets the accessible relation to its default value. *)

  external reset_property : t -> Ocgtk_enums.accessibleproperty -> unit
    = "ml_gtk_accessible_reset_property"
  (** Resets the accessible property to its default value. *)

  external get_platform_state : t -> Ocgtk_enums.accessibleplatformstate -> bool
    = "ml_gtk_accessible_get_platform_state"
  (** Queries a platform state, such as focus.

      This functionality can be overridden by [GtkAccessible] implementations,
      e.g. to get platform state from an ignored child widget, as is the case
      for [GtkText] wrappers. *)

  external get_next_accessible_sibling : t -> t option
    = "ml_gtk_accessible_get_next_accessible_sibling"
  (** Retrieves the next accessible sibling of an accessible object *)

  external get_first_accessible_child : t -> t option
    = "ml_gtk_accessible_get_first_accessible_child"
  (** Retrieves the first accessible child of an accessible object. *)

  external get_bounds : t -> bool * int * int * int * int
    = "ml_gtk_accessible_get_bounds"
  (** Queries the coordinates and dimensions of this accessible

      This functionality can be overridden by [GtkAccessible] implementations,
      e.g. to get the bounds from an ignored child widget. *)

  external get_at_context : t -> At_context.t
    = "ml_gtk_accessible_get_at_context"
  (** Retrieves the implementation for the given accessible object. *)

  external get_accessible_role : t -> Ocgtk_enums.accessiblerole
    = "ml_gtk_accessible_get_accessible_role"
  (** Retrieves the accessible role of an accessible object. *)

  external get_accessible_parent : t -> t option
    = "ml_gtk_accessible_get_accessible_parent"
  (** Retrieves the accessible parent for an accessible object.

      This function returns [NULL] for top level widgets. *)

  external announce :
    t -> string -> Ocgtk_enums.accessibleannouncementpriority -> unit
    = "ml_gtk_accessible_announce"
  (** Requests the user's screen reader to announce the given message.

      This kind of notification is useful for messages that either have only a
      visual representation or that are not exposed visually at all, e.g. a
      notification about a successful operation.

      Also, by using this API, you can ensure that the message does not
      interrupts the user's current screen reader output. *)

  (* Properties *)
end
