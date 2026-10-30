(** A [PangoScriptIter] is used to iterate through a string and identify ranges
    in different scripts.

    Its methods, signals and properties are on {!class-type-script_iter_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Script_iter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ScriptIter].}

    A [PangoScriptIter] is used to iterate through a string and identify ranges
    in different scripts. *)
class type script_iter_t = object
  (** {2:methods Methods} *)

  method next : unit -> bool
  (** Advances a [PangoScriptIter] to the next range.

      If [iter] is already at the end, it is left unchanged and [false] is
      returned. *)

  (** {2:conversions Conversions} *)

  method as_script_iter : Raw.Script_iter.t
end

class script_iter : Raw.Script_iter.t -> script_iter_t
(** Wraps a raw handle of {!Ocpango.Raw.Script_iter.t}. *)

(** {1:constructors Constructors} *)

val new_ : string -> int -> script_iter_t
(** Create a new [PangoScriptIter], used to break a string of Unicode text into
    runs by Unicode script.

    No copy is made of [text], so the caller needs to make sure it remains valid
    until the iterator is freed with [Pango.ScriptIter.free]. *)
