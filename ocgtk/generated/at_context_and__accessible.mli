(** The classes of {!Ocgtk.At_context}, {!Ocgtk.Accessible}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GtkATContext]. *)
class type at_context_t = object
  method on_state_change :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_accessible : unit -> accessible_t
  (** Retrieves the [GtkAccessible] using this context. *)

  method get_accessible_role : unit -> Enums.accessiblerole
  (** Retrieves the accessible role of this context. *)

  method display : Ocgdk.Display.display_t
  method set_display : Ocgdk.Display.display_t -> unit
  method as_at_context : Raw.At_context.t
end

(** The methods, signals and properties of a [GtkAccessible]. *)
and accessible_t = object
  method announce : string -> Enums.accessibleannouncementpriority -> unit
  (** Requests the user's screen reader to announce the given message.

      This kind of notification is useful for messages that either have only a
      visual representation or that are not exposed visually at all, e.g. a
      notification about a successful operation.

      Also, by using this API, you can ensure that the message does not
      interrupts the user's current screen reader output. *)

  method get_accessible_parent : unit -> accessible_t option
  (** Retrieves the accessible parent for an accessible object.

      This function returns [NULL] for top level widgets. *)

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

  method as_accessible : Raw.Accessible.t
end

(** Wraps a layer 1 handle, {!Ocgtk.Raw.At_context.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkATContext], give one already wrapped. *)
class at_context : Raw.At_context.t -> at_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Accessible.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAccessible], give one already wrapped. *)

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
