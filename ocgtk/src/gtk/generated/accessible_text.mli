(* GENERATED CODE - DO NOT EDIT *)
(* AccessibleText: AccessibleText *)

(** An interface for accessible objects containing formatted text.

    The [GtkAccessibleText] interfaces is meant to be implemented by accessible
    objects that have text formatted with attributes, or non-trivial text
    contents.

    You should use the [Gtk.AccessibleProperty.LABEL] or the
    [Gtk.AccessibleProperty.DESCRIPTION] properties for accessible objects
    containing simple, unformatted text. *)

type t = [ `accessible_text ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_accessible_text_from_gobject"

(* Methods *)

external update_selection_bound : t -> unit
  = "ml_gtk_accessible_text_update_selection_bound"
(** Updates the boundary of the selection.

    Implementations of the [GtkAccessibleText] interface should call this
    function every time the selection has moved, in order to notify assistive
    technologies. *)

external update_contents :
  t -> Gtk_enums.accessibletextcontentchange -> int -> int -> unit
  = "ml_gtk_accessible_text_update_contents"
(** Notifies assistive technologies of a change in contents.

    Implementations of the [GtkAccessibleText] interface should call this
    function every time their contents change as the result of an operation,
    like an insertion or a removal.

    Note: If the change is a deletion, this function must be called {i before}
    removing the contents, if it is an insertion, it must be called {i after}
    inserting the new contents. *)

external update_caret_position : t -> unit
  = "ml_gtk_accessible_text_update_caret_position"
(** Updates the position of the caret.

    Implementations of the [GtkAccessibleText] interface should call this
    function every time the caret has moved, in order to notify assistive
    technologies. *)
