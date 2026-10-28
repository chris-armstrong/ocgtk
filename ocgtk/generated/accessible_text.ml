class type accessible_text_t = object
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

  method as_accessible_text : Raw.Accessible_text.t
end

(* High-level class for AccessibleText *)
class accessible_text (obj : Raw.Accessible_text.t) : accessible_text_t =
  object (self)
    method update_caret_position : unit -> unit =
      fun () -> Raw.Accessible_text.update_caret_position obj

    method update_contents :
        Enums.accessibletextcontentchange -> int -> int -> unit =
      fun change start end_ ->
        Raw.Accessible_text.update_contents obj change start end_

    method update_selection_bound : unit -> unit =
      fun () -> Raw.Accessible_text.update_selection_bound obj

    method as_accessible_text = obj
  end
