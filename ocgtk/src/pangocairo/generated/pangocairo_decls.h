/* GENERATED CODE - DO NOT EDIT */
/* Forward declarations for generated enum, bitfield, class and record converters */

#ifndef _pangocairo_decls_h_
#define _pangocairo_decls_h_

#include <pango/pangocairo.h>
#include <caml/mlvalues.h>

/* Dependency headers for cross-namespace types */
#include "generated/pango_decls.h"
#include "generated/cairo_decls.h"

/* Class-specific conversion macros (shared) */
/* Interface-specific conversion macros (shared) */
#ifndef Val_PangoCairoFont
#define PangoCairoFont_val(val) ((PangoCairoFont*)ml_gobject_ext_of_val(val))
#define Val_PangoCairoFont(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoCairoFont */

#ifndef Val_PangoCairoFontMap
#define PangoCairoFontMap_val(val) ((PangoCairoFontMap*)ml_gobject_ext_of_val(val))
#define Val_PangoCairoFontMap(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoCairoFontMap */

/* Forward declarations for record converters (non-opaque records) */
/* Const-safe string extraction for setters */
#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar *)(expr)

/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */


#endif /* _pangocairo_decls_h_ */
