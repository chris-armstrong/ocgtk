/* GENERATED CODE - DO NOT EDIT */
/* Forward declarations for generated enum, bitfield, class and record converters */

#ifndef _graphene_decls_h_
#define _graphene_decls_h_

#include <graphene-gobject.h>
#include <caml/mlvalues.h>

/* Class-specific conversion macros (shared) */
/* Interface-specific conversion macros (shared) */
/* Forward declarations for record converters (non-opaque records) */
/* Forward declarations for graphene_box_t converters */
graphene_box_t *graphene_box_t_val(value val);
value Val_graphene_box_t(const graphene_box_t *ptr);
value Val_graphene_box_t_option(const graphene_box_t *ptr);

/* Forward declarations for graphene_euler_t converters */
graphene_euler_t *graphene_euler_t_val(value val);
value Val_graphene_euler_t(const graphene_euler_t *ptr);
value Val_graphene_euler_t_option(const graphene_euler_t *ptr);

/* Forward declarations for graphene_frustum_t converters */
graphene_frustum_t *graphene_frustum_t_val(value val);
value Val_graphene_frustum_t(const graphene_frustum_t *ptr);
value Val_graphene_frustum_t_option(const graphene_frustum_t *ptr);

/* Forward declarations for graphene_matrix_t converters */
graphene_matrix_t *graphene_matrix_t_val(value val);
value Val_graphene_matrix_t(const graphene_matrix_t *ptr);
value Val_graphene_matrix_t_option(const graphene_matrix_t *ptr);

/* Forward declarations for graphene_plane_t converters */
graphene_plane_t *graphene_plane_t_val(value val);
value Val_graphene_plane_t(const graphene_plane_t *ptr);
value Val_graphene_plane_t_option(const graphene_plane_t *ptr);

/* Forward declarations for graphene_point_t converters */
graphene_point_t *graphene_point_t_val(value val);
value Val_graphene_point_t(const graphene_point_t *ptr);
value Val_graphene_point_t_option(const graphene_point_t *ptr);

/* Forward declarations for graphene_point3d_t converters */
graphene_point3d_t *graphene_point3d_t_val(value val);
value Val_graphene_point3d_t(const graphene_point3d_t *ptr);
value Val_graphene_point3d_t_option(const graphene_point3d_t *ptr);

/* Forward declarations for graphene_quad_t converters */
graphene_quad_t *graphene_quad_t_val(value val);
value Val_graphene_quad_t(const graphene_quad_t *ptr);
value Val_graphene_quad_t_option(const graphene_quad_t *ptr);

/* Forward declarations for graphene_quaternion_t converters */
graphene_quaternion_t *graphene_quaternion_t_val(value val);
value Val_graphene_quaternion_t(const graphene_quaternion_t *ptr);
value Val_graphene_quaternion_t_option(const graphene_quaternion_t *ptr);

/* Forward declarations for graphene_ray_t converters */
graphene_ray_t *graphene_ray_t_val(value val);
value Val_graphene_ray_t(const graphene_ray_t *ptr);
value Val_graphene_ray_t_option(const graphene_ray_t *ptr);

/* Forward declarations for graphene_rect_t converters */
graphene_rect_t *graphene_rect_t_val(value val);
value Val_graphene_rect_t(const graphene_rect_t *ptr);
value Val_graphene_rect_t_option(const graphene_rect_t *ptr);

/* Forward declarations for graphene_simd4f_t converters */
graphene_simd4f_t *graphene_simd4f_t_val(value val);
value Val_graphene_simd4f_t(const graphene_simd4f_t *ptr);
value Val_graphene_simd4f_t_option(const graphene_simd4f_t *ptr);

/* Forward declarations for graphene_simd4x4f_t converters */
graphene_simd4x4f_t *graphene_simd4x4f_t_val(value val);
value Val_graphene_simd4x4f_t(const graphene_simd4x4f_t *ptr);
value Val_graphene_simd4x4f_t_option(const graphene_simd4x4f_t *ptr);

/* Forward declarations for graphene_size_t converters */
graphene_size_t *graphene_size_t_val(value val);
value Val_graphene_size_t(const graphene_size_t *ptr);
value Val_graphene_size_t_option(const graphene_size_t *ptr);

/* Forward declarations for graphene_sphere_t converters */
graphene_sphere_t *graphene_sphere_t_val(value val);
value Val_graphene_sphere_t(const graphene_sphere_t *ptr);
value Val_graphene_sphere_t_option(const graphene_sphere_t *ptr);

/* Forward declarations for graphene_triangle_t converters */
graphene_triangle_t *graphene_triangle_t_val(value val);
value Val_graphene_triangle_t(const graphene_triangle_t *ptr);
value Val_graphene_triangle_t_option(const graphene_triangle_t *ptr);

/* Forward declarations for graphene_vec2_t converters */
graphene_vec2_t *graphene_vec2_t_val(value val);
value Val_graphene_vec2_t(const graphene_vec2_t *ptr);
value Val_graphene_vec2_t_option(const graphene_vec2_t *ptr);

/* Forward declarations for graphene_vec3_t converters */
graphene_vec3_t *graphene_vec3_t_val(value val);
value Val_graphene_vec3_t(const graphene_vec3_t *ptr);
value Val_graphene_vec3_t_option(const graphene_vec3_t *ptr);

/* Forward declarations for graphene_vec4_t converters */
graphene_vec4_t *graphene_vec4_t_val(value val);
value Val_graphene_vec4_t(const graphene_vec4_t *ptr);
value Val_graphene_vec4_t_option(const graphene_vec4_t *ptr);

/* Const-safe string extraction for setters */
#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar *)(expr)

/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */

/* Forward declarations for enum converters */
value Val_GrapheneEulerOrder(graphene_euler_order_t val);
graphene_euler_order_t GrapheneEulerOrder_val(value val);
value Val_GrapheneRayIntersectionKind(graphene_ray_intersection_kind_t val);
graphene_ray_intersection_kind_t GrapheneRayIntersectionKind_val(value val);


#endif /* _graphene_decls_h_ */
