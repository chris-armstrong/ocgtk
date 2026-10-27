(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec4 from cyclic group Vec3_and__vec4 *)

class type vec4_t = Vec3_and__vec4.vec4_t

class vec4 : Raw.Vec4.t -> vec4_t

val alloc : unit -> vec4_t
