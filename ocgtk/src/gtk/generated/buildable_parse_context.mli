(* GENERATED CODE - DO NOT EDIT *)
(* BuildableParseContext: BuildableParseContext *)

(** An opaque context struct for `GtkBuildableParser`. *)
type t = [`buildable_parse_context] Gobject.obj

(* Methods *)
(** Retrieves the current line number and the number of the character on
that line. Intended for use in error messages; there are no strict
semantics for what constitutes the "current" line number other than
"the best number we could come up with for error messages." *)
external get_position : t -> int * int = "ml_gtk_buildable_parse_context_get_position"

(** Retrieves the name of the currently open element.

If called from the start_element or end_element handlers this will
give the element_name as passed to those functions. For the parent
elements, see gtk_buildable_parse_context_get_element_stack(). *)
external get_element : t -> string option = "ml_gtk_buildable_parse_context_get_element"

