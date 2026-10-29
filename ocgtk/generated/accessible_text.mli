(** An interface for accessible objects containing formatted text.

    Its methods, signals and properties are on {!class-type-accessible_text_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Accessible_text}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AccessibleText].}

    Requires:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}

    An interface for accessible objects containing formatted text.

    The [GtkAccessibleText] interfaces is meant to be implemented by accessible
    objects that have text formatted with attributes, or non-trivial text
    contents.

    You should use the [Gtk.AccessibleProperty.LABEL] or the
    [Gtk.AccessibleProperty.DESCRIPTION] properties for accessible objects
    containing simple, unformatted text. *)
class type accessible_text_t = object
  (** {2:methods Methods} *)

  method update_caret_position : unit -> unit
  (** Updates the position of the caret.

      Implementations of the [GtkAccessibleText] interface should call this
      function every time the caret has moved, in order to notify assistive
      technologies. *)

  method update_contents :
    Enums.accessibletextcontentchange -> int -> int -> unit
  (** Notifies assistive technologies of a change in contents.

      Implementations of the [GtkAccessibleText] interface should call this
      function every time their contents change as the result of an operation,
      like an insertion or a removal.

      Note: If the change is a deletion, this function must be called {i before}
      removing the contents, if it is an insertion, it must be called {i after}
      inserting the new contents. *)

  method update_selection_bound : unit -> unit
  (** Updates the boundary of the selection.

      Implementations of the [GtkAccessibleText] interface should call this
      function every time the selection has moved, in order to notify assistive
      technologies. *)

  (** {2:conversions Conversions} *)

  method as_accessible_text : Raw.Accessible_text.t
end

class accessible_text : Raw.Accessible_text.t -> accessible_text_t
(** Wraps a raw handle of {!Ocgtk.Raw.Accessible_text.t}. *)

(** {1:description Description}

    An interface for accessible objects containing formatted text.

    The [GtkAccessibleText] interfaces is meant to be implemented by accessible
    objects that have text formatted with attributes, or non-trivial text
    contents.

    You should use the [Gtk.AccessibleProperty.LABEL] or the
    [Gtk.AccessibleProperty.DESCRIPTION] properties for accessible objects
    containing simple, unformatted text. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
