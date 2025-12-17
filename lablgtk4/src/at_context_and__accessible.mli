(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec At_context : sig
  type t = [`at_context | `object_] Gobject.obj

  (** Create a new ATContext *)
  external create : Gtk_enums.accessiblerole -> Accessible.t -> unit -> t = "ml_gtk_at_context_create"

  (* Properties *)

  (** Retrieves the accessible role of this context. *)
  external get_accessible_role : t -> Gtk_enums.accessiblerole = "ml_gtk_at_context_get_accessible_role"

  (** Retrieves the `GtkAccessible` using this context. *)
  external get_accessible : t -> Accessible.t = "ml_gtk_at_context_get_accessible"


end

and Accessible
 : sig
  type t = [`accessible] Gobject.obj

  (* Properties *)

  (** Updates the next accessible sibling of @self.

  That might be useful when a new child of a custom `GtkAccessible`
  is created, and it needs to be linked to a previous child. *)
  external update_next_accessible_sibling : t -> t option -> unit = "ml_gtk_accessible_update_next_accessible_sibling"

  (** Sets the parent and sibling of an accessible object.

  This function is meant to be used by accessible implementations that are
  not part of the widget hierarchy, and but act as a logical bridge between
  widgets. For instance, if a widget creates an object that holds metadata
  for each child, and you want that object to implement the `GtkAccessible`
  interface, you will use this function to ensure that the parent of each
  child widget is the metadata object, and the parent of each metadata
  object is the container widget. *)
  external set_accessible_parent : t -> t option -> t option -> unit = "ml_gtk_accessible_set_accessible_parent"

  (** Resets the accessible @state to its default value. *)
  external reset_state : t -> Gtk_enums.accessiblestate -> unit = "ml_gtk_accessible_reset_state"

  (** Resets the accessible @relation to its default value. *)
  external reset_relation : t -> Gtk_enums.accessiblerelation -> unit = "ml_gtk_accessible_reset_relation"

  (** Resets the accessible @property to its default value. *)
  external reset_property : t -> Gtk_enums.accessibleproperty -> unit = "ml_gtk_accessible_reset_property"

  (** Query a platform state, such as focus.

  See gtk_accessible_platform_changed().

  This functionality can be overridden by `GtkAccessible`
  implementations, e.g. to get platform state from an ignored
  child widget, as is the case for `GtkText` wrappers. *)
  external get_platform_state : t -> Gtk_enums.accessibleplatformstate -> bool = "ml_gtk_accessible_get_platform_state"

  (** Retrieves the next accessible sibling of an accessible object *)
  external get_next_accessible_sibling : t -> t option = "ml_gtk_accessible_get_next_accessible_sibling"

  (** Retrieves the first accessible child of an accessible object. *)
  external get_first_accessible_child : t -> t option = "ml_gtk_accessible_get_first_accessible_child"

  (** Retrieves the accessible implementation for the given `GtkAccessible`. *)
  external get_at_context : t -> At_context.t = "ml_gtk_accessible_get_at_context"

  (** Retrieves the accessible role of an accessible object. *)
  external get_accessible_role : t -> Gtk_enums.accessiblerole = "ml_gtk_accessible_get_accessible_role"

  (** Retrieves the accessible parent for an accessible object.

  This function returns `NULL` for top level widgets. *)
  external get_accessible_parent : t -> t option = "ml_gtk_accessible_get_accessible_parent"

  (** Requests the user's screen reader to announce the given message.

  This kind of notification is useful for messages that
  either have only a visual representation or that are not
  exposed visually at all, e.g. a notification about a
  successful operation.

  Also, by using this API, you can ensure that the message
  does not interrupts the user's current screen reader output. *)
  external announce : t -> string -> Gtk_enums.accessibleannouncementpriority -> unit = "ml_gtk_accessible_announce"


end
