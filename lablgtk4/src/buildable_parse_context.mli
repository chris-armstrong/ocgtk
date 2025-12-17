(* GENERATED CODE - DO NOT EDIT *)
(* BuildableParseContext: BuildableParseContext *)

(** An opaque context struct for `GtkBuildableParser`. *)
type t = [`buildable_parse_context] Gobject.obj

(** Retrieves the element stack from the internal state of the parser.

The returned `GPtrArray` is an array of strings where the last item is
the currently open tag (as would be returned by
gtk_buildable_parse_context_get_element()) and the previous item is its
immediate parent.

This function is intended to be used in the start_element and
end_element handlers where gtk_buildable_parse_context_get_element()
would merely return the name of the element that is being
processed. *)
external get_element_stack : t -> unit = "ml_gtk_buildable_parse_context_get_element_stack"

(** Retrieves the name of the currently open element.

If called from the start_element or end_element handlers this will
give the element_name as passed to those functions. For the parent
elements, see gtk_buildable_parse_context_get_element_stack(). *)
external get_element : t -> string option = "ml_gtk_buildable_parse_context_get_element"

