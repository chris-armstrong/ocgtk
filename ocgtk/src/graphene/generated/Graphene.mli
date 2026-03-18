(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class box : Box_and__sphere.Box.t -> GBox_and__sphere.box
class euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.euler
class frustum : Frustum.t -> GFrustum.frustum
class matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.matrix
class plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.plane
class point : Point.t -> GPoint.point
class point3_d : Point3_d.t -> GPoint3_d.point3_d
class quad : Quad.t -> GQuad.quad
class quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.quaternion
class ray : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t -> GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.ray
class rect : Rect.t -> GRect.rect
class simd4_f : Simd4_f.t -> GSimd4_f.simd4_f
class simd4_x4_f : Simd4_x4_f.t -> GSimd4_x4_f.simd4_x4_f
class size : Size.t -> GSize.size
class sphere : Box_and__sphere.Sphere.t -> GBox_and__sphere.sphere
class triangle : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t -> GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.triangle
class vec2 : Vec2.t -> GVec2.vec2
class vec3 : Vec3_and__vec4.Vec3.t -> GVec3_and__vec4.vec3
class vec4 : Vec3_and__vec4.Vec4.t -> GVec3_and__vec4.vec4

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Box = Box_and__sphere.Box
  module Euler = Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler
  module Frustum = Frustum
  module Matrix = Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix
  module Plane = Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane
  module Point = Point
  module Point3_d = Point3_d
  module Quad = Quad
  module Quaternion = Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion
  module Ray = Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray
  module Rect = Rect
  module Simd4_f = Simd4_f
  module Simd4_x4_f = Simd4_x4_f
  module Size = Size
  module Sphere = Box_and__sphere.Sphere
  module Triangle = Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle
  module Vec2 = Vec2
  module Vec3 = Vec3_and__vec4.Vec3
  module Vec4 = Vec3_and__vec4.Vec4
end

(** {1 Enumerations and Bitfields} *)

type eulerorder = Graphene_enums.eulerorder
type rayintersectionkind = Graphene_enums.rayintersectionkind
