/* GENERATED CODE - DO NOT EDIT */
/* Forward declarations for generated enum, bitfield, class and record converters */

#ifndef _cairo_decls_h_
#define _cairo_decls_h_

#include <cairo-gobject.h>
#include <caml/mlvalues.h>

/* Class-specific conversion macros (shared) */
/* Interface-specific conversion macros (shared) */
/* Forward declarations for record converters (non-opaque records) */
/* Forward declarations for cairo_t converters */
cairo_t *cairo_t_val(value val);
value Val_cairo_t(const cairo_t *ptr);
value Val_cairo_t_option(const cairo_t *ptr);

/* Forward declarations for cairo_device_t converters */
cairo_device_t *cairo_device_t_val(value val);
value Val_cairo_device_t(const cairo_device_t *ptr);
value Val_cairo_device_t_option(const cairo_device_t *ptr);

/* Forward declarations for cairo_surface_t converters */
cairo_surface_t *cairo_surface_t_val(value val);
value Val_cairo_surface_t(const cairo_surface_t *ptr);
value Val_cairo_surface_t_option(const cairo_surface_t *ptr);

/* Forward declarations for cairo_matrix_t converters */
cairo_matrix_t *cairo_matrix_t_val(value val);
value Val_cairo_matrix_t(const cairo_matrix_t *ptr);
value Val_cairo_matrix_t_option(const cairo_matrix_t *ptr);

/* Forward declarations for cairo_pattern_t converters */
cairo_pattern_t *cairo_pattern_t_val(value val);
value Val_cairo_pattern_t(const cairo_pattern_t *ptr);
value Val_cairo_pattern_t_option(const cairo_pattern_t *ptr);

/* Forward declarations for cairo_region_t converters */
cairo_region_t *cairo_region_t_val(value val);
value Val_cairo_region_t(const cairo_region_t *ptr);
value Val_cairo_region_t_option(const cairo_region_t *ptr);

/* Forward declarations for cairo_font_options_t converters */
cairo_font_options_t *cairo_font_options_t_val(value val);
value Val_cairo_font_options_t(const cairo_font_options_t *ptr);
value Val_cairo_font_options_t_option(const cairo_font_options_t *ptr);

/* Forward declarations for cairo_font_face_t converters */
cairo_font_face_t *cairo_font_face_t_val(value val);
value Val_cairo_font_face_t(const cairo_font_face_t *ptr);
value Val_cairo_font_face_t_option(const cairo_font_face_t *ptr);

/* Forward declarations for cairo_scaled_font_t converters */
cairo_scaled_font_t *cairo_scaled_font_t_val(value val);
value Val_cairo_scaled_font_t(const cairo_scaled_font_t *ptr);
value Val_cairo_scaled_font_t_option(const cairo_scaled_font_t *ptr);

/* Forward declarations for cairo_path_t converters */
cairo_path_t *cairo_path_t_val(value val);
value Val_cairo_path_t(const cairo_path_t *ptr);
value Val_cairo_path_t_option(const cairo_path_t *ptr);

/* Forward declarations for cairo_rectangle_t converters */
cairo_rectangle_t *cairo_rectangle_t_val(value val);
value Val_cairo_rectangle_t(const cairo_rectangle_t *ptr);
value Val_cairo_rectangle_t_option(const cairo_rectangle_t *ptr);

/* Forward declarations for cairo_rectangle_int_t converters */
cairo_rectangle_int_t *cairo_rectangle_int_t_val(value val);
value Val_cairo_rectangle_int_t(const cairo_rectangle_int_t *ptr);
value Val_cairo_rectangle_int_t_option(const cairo_rectangle_int_t *ptr);

/* Const-safe string extraction for setters */
#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar *)(expr)

/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */

/* Forward declarations for enum converters */
value Val_cairoStatus(cairo_status_t val);
cairo_status_t cairoStatus_val(value val);
value Val_cairoContent(cairo_content_t val);
cairo_content_t cairoContent_val(value val);
value Val_cairoOperator(cairo_operator_t val);
cairo_operator_t cairoOperator_val(value val);
value Val_cairoAntialias(cairo_antialias_t val);
cairo_antialias_t cairoAntialias_val(value val);
value Val_cairoFillRule(cairo_fill_rule_t val);
cairo_fill_rule_t cairoFillRule_val(value val);
value Val_cairoLineCap(cairo_line_cap_t val);
cairo_line_cap_t cairoLineCap_val(value val);
value Val_cairoLineJoin(cairo_line_join_t val);
cairo_line_join_t cairoLineJoin_val(value val);
value Val_cairoTextClusterFlags(cairo_text_cluster_flags_t val);
cairo_text_cluster_flags_t cairoTextClusterFlags_val(value val);
value Val_cairoFontSlant(cairo_font_slant_t val);
cairo_font_slant_t cairoFontSlant_val(value val);
value Val_cairoFontWeight(cairo_font_weight_t val);
cairo_font_weight_t cairoFontWeight_val(value val);
value Val_cairoSubpixelOrder(cairo_subpixel_order_t val);
cairo_subpixel_order_t cairoSubpixelOrder_val(value val);
value Val_cairoHintStyle(cairo_hint_style_t val);
cairo_hint_style_t cairoHintStyle_val(value val);
value Val_cairoHintMetrics(cairo_hint_metrics_t val);
cairo_hint_metrics_t cairoHintMetrics_val(value val);
value Val_cairoFontType(cairo_font_type_t val);
cairo_font_type_t cairoFontType_val(value val);
value Val_cairoPathDataType(cairo_path_data_type_t val);
cairo_path_data_type_t cairoPathDataType_val(value val);
value Val_cairoDeviceType(cairo_device_type_t val);
cairo_device_type_t cairoDeviceType_val(value val);
value Val_cairoSurfaceType(cairo_surface_type_t val);
cairo_surface_type_t cairoSurfaceType_val(value val);
value Val_cairoFormat(cairo_format_t val);
cairo_format_t cairoFormat_val(value val);
value Val_cairoPatternType(cairo_pattern_type_t val);
cairo_pattern_type_t cairoPatternType_val(value val);
value Val_cairoExtend(cairo_extend_t val);
cairo_extend_t cairoExtend_val(value val);
value Val_cairoFilter(cairo_filter_t val);
cairo_filter_t cairoFilter_val(value val);
value Val_cairoRegionOverlap(cairo_region_overlap_t val);
cairo_region_overlap_t cairoRegionOverlap_val(value val);


#include "../core/cairo_core.h"

#endif /* _cairo_decls_h_ */
