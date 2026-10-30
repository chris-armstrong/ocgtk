(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for MenuLinkIter from cyclic group Menu_link_iter_and__menu_model *)

(** {{!Ocgio.Menu_link_iter.class-type-menu_link_iter_t}[GMenuLinkIter]} is an
    opaque structure type. You must access it using the functions below.

    Its methods, signals and properties are on {!class-type-menu_link_iter_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.Menu_link_iter}. *)

(** {1:class Class} *)

class type menu_link_iter_t = Menu_link_iter_and__menu_model.menu_link_iter_t
(** {b The methods, signals and properties of a [MenuLinkIter].}

    {{!Ocgio.Menu_link_iter.class-type-menu_link_iter_t}[GMenuLinkIter]} is an
    opaque structure type. You must access it using the functions below. *)

class menu_link_iter : Raw.Menu_link_iter.t -> menu_link_iter_t
(** Wraps a raw handle of {!Ocgio.Raw.Menu_link_iter.t}. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
