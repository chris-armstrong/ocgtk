(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TextIter from cyclic group Text_buffer_and__text_iter_and__text_mark *)

(** Iterates over the contents of a [GtkTextBuffer].

    Its methods, signals and properties are on {!class-type-text_iter_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgtk.Raw.Text_iter}. *)

(** {1:class Class} *)

class type text_iter_t = Text_buffer_and__text_iter_and__text_mark.text_iter_t
(** {b The methods, signals and properties of a [TextIter].}

    Iterates over the contents of a [GtkTextBuffer].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together. *)

class text_iter : Raw.Text_iter.t -> text_iter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Text_iter.t}. *)

(** {1:description Description}

    Iterates over the contents of a [GtkTextBuffer].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together. *)
