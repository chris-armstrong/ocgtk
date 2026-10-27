(** A [PangoScriptIter] is used to iterate through a string and identify ranges
    in different scripts.

    Its methods, signals and properties are on {!class-type-script_iter_t}. The
    functions it is built on are in {!Ocpango.Raw.Script_iter}. *)

(** The methods, signals and properties of a [PangoScriptIter]. *)
class type script_iter_t = object
  method next : unit -> bool
  method as_script_iter : Raw.Script_iter.t
end

class script_iter : Raw.Script_iter.t -> script_iter_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Script_iter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoScriptIter], give one already wrapped. *)

val new_ : string -> int -> script_iter_t
