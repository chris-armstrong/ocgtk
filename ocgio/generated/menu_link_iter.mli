(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for MenuLinkIter from cyclic group Menu_link_iter_and__menu_model *)

(** [GMenuLinkIter] is an opaque structure type. You must access it using the
    functions below.

    Its methods, signals and properties are on {!class-type-menu_link_iter_t}.
    The functions it is built on are in {!Ocgio.Raw.Menu_link_iter}. *)

class type menu_link_iter_t = Menu_link_iter_and__menu_model.menu_link_iter_t
(** {b The methods, signals and properties of a [MenuLinkIter].}

    [GMenuLinkIter] is an opaque structure type. You must access it using the
    functions below. *)

class menu_link_iter : Raw.Menu_link_iter.t -> menu_link_iter_t
(** Wraps a raw handle of {!Ocgio.Raw.Menu_link_iter.t}. *)
