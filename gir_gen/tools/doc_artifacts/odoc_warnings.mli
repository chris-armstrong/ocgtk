(** odoc's warnings in the output of [dune build @doc]. *)

val report : string -> string list
(** Each odoc warning in the build output, as one string: the warning line,
    preceded by its [File ...] location line when there is one. odoc's warnings
    start with [Warning: ]; the compiler's ([Warning 50 [...]:]) are not odoc's
    and are left out, as the preview workflow's count does. *)
