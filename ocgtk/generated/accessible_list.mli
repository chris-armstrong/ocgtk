(** Wraps a list of references to [Gtk.Accessible] objects.

    Its methods, signals and properties are on {!class-type-accessible_list_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Accessible_list}. *)

(** {b The methods, signals and properties of a [AccessibleList].}

    Wraps a list of references to [Gtk.Accessible] objects. *)
class type accessible_list_t = object
  method get_objects : unit -> At_context_and__accessible.accessible_t list
  (** Gets the list of objects this boxed type holds. *)

  method as_accessible_list : Raw.Accessible_list.t
end

class accessible_list : Raw.Accessible_list.t -> accessible_list_t
(** Wraps a raw handle of {!Ocgtk.Raw.Accessible_list.t}. *)

(** {2:constructors Constructors} *)

val new_from_array : Raw.Accessible.t array -> Gsize.t -> accessible_list_t
(** Allocates a new list of accessible objects. *)

val new_from_list : Raw.Accessible.t list -> accessible_list_t
(** Allocates a new [GtkAccessibleList], doing a shallow copy of the passed list
    of accessible objects *)
