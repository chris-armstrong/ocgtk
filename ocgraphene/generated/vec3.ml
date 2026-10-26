(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec3 from cyclic group Vec3_and__vec4 *)

class type vec3_t = Vec3_and__vec4.vec3_t

class vec3 = Vec3_and__vec4.vec3

let alloc () : vec3_t = new vec3 (Raw.Vec3.alloc ())
