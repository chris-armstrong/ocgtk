(** A range inside the text of an accessible object.

    Its methods, signals and properties are on
    {!class-type-accessible_text_range_t}. The functions it is built on are in
    {!Ocgtk.Raw.Accessible_text_range}. *)

(** The methods, signals and properties of a [GtkAccessibleTextRange]. *)
class type accessible_text_range_t = object
  method as_accessible_text_range : Raw.Accessible_text_range.t
end

class accessible_text_range :
  Raw.Accessible_text_range.t ->
  accessible_text_range_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Accessible_text_range.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkAccessibleTextRange], give one already wrapped. *)
