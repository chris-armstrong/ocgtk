(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Vec3 from cyclic group Vec3_and__vec4 *)

class type vec3_t = GVec3_and__vec4.vec3_t

class vec3 = GVec3_and__vec4.vec3
let alloc () : vec3_t =
  new vec3 (Vec3_and__vec4.Vec3.alloc ())

