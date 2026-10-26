(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec4 from cyclic group Vec3_and__vec4 *)

class type vec4_t = Vec3_and__vec4.vec4_t

class vec4 = Vec3_and__vec4.vec4

let alloc () : vec4_t = new vec4 (Raw.Vec4.alloc ())
