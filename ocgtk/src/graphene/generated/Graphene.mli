(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class type box_t = GBox_and__sphere.box_t
class type euler_t = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.euler_t
class type frustum_t = GFrustum.frustum_t
class type matrix_t = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.matrix_t
class type plane_t = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.plane_t
class type point_t = GPoint.point_t
class type point3_d_t = GPoint3_d.point3_d_t
class type quad_t = GQuad.quad_t
class type quaternion_t = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.quaternion_t
class type ray_t = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.ray_t
class type rect_t = GRect.rect_t
class type simd4_f_t = GSimd4_f.simd4_f_t
class type simd4_x4_f_t = GSimd4_x4_f.simd4_x4_f_t
class type size_t = GSize.size_t
class type sphere_t = GBox_and__sphere.sphere_t
class type triangle_t = GEuler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.triangle_t
class type vec2_t = GVec2.vec2_t
class type vec3_t = GVec3_and__vec4.vec3_t
class type vec4_t = GVec3_and__vec4.vec4_t

class box : Box_and__sphere.Box.t -> box_t
class euler : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Euler.t -> euler_t
class frustum : Frustum.t -> frustum_t
class matrix : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Matrix.t -> matrix_t
class plane : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Plane.t -> plane_t
class point : Point.t -> point_t
class point3_d : Point3_d.t -> point3_d_t
class quad : Quad.t -> quad_t
class quaternion : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Quaternion.t -> quaternion_t
class ray : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Ray.t -> ray_t
class rect : Rect.t -> rect_t
class simd4_f : Simd4_f.t -> simd4_f_t
class simd4_x4_f : Simd4_x4_f.t -> simd4_x4_f_t
class size : Size.t -> size_t
class sphere : Box_and__sphere.Sphere.t -> sphere_t
class triangle : Euler_and__matrix_and__plane_and__quaternion_and__ray_and__triangle.Triangle.t -> triangle_t
class vec2 : Vec2.t -> vec2_t
class vec3 : Vec3_and__vec4.Vec3.t -> vec3_t
class vec4 : Vec3_and__vec4.Vec4.t -> vec4_t

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
