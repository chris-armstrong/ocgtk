(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TextIter from cyclic group Text_buffer_and__text_iter_and__text_mark *)

(** Iterates over the contents of a [GtkTextBuffer].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    Its methods, signals and properties are on {!class-type-text_iter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Text_iter}. *)

class type text_iter_t = Text_buffer_and__text_iter_and__text_mark.text_iter_t
(** The methods, signals and properties of a [GtkTextIter]. *)

class text_iter : Raw.Text_iter.t -> text_iter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Text_iter.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTextIter], give one already wrapped. *)
