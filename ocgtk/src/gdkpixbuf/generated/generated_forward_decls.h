/* GENERATED CODE - DO NOT EDIT */
/* Forward declarations for generated enum, bitfield, class and record converters */

#ifndef _gdkpixbuf_generated_forward_decls_
#define _gdkpixbuf_generated_forward_decls_

#include <gdk-pixbuf/gdk-pixbuf.h>
#include <caml/mlvalues.h>

/* Class-specific conversion macros (shared) */
#ifndef Val_GdkPixbuf
#define GdkPixbuf_val(val) ((GdkPixbuf*)ml_gobject_ext_of_val(val))
#define Val_GdkPixbuf(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GdkPixbuf */

#ifndef Val_GdkPixbufAnimation
#define GdkPixbufAnimation_val(val) ((GdkPixbufAnimation*)ml_gobject_ext_of_val(val))
#define Val_GdkPixbufAnimation(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GdkPixbufAnimation */

#ifndef Val_GdkPixbufAnimationIter
#define GdkPixbufAnimationIter_val(val) ((GdkPixbufAnimationIter*)ml_gobject_ext_of_val(val))
#define Val_GdkPixbufAnimationIter(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GdkPixbufAnimationIter */

#ifndef Val_GdkPixbufLoader
#define GdkPixbufLoader_val(val) ((GdkPixbufLoader*)ml_gobject_ext_of_val(val))
#define Val_GdkPixbufLoader(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GdkPixbufLoader */

#ifndef Val_GtkPixbufNonAnim
#define GtkPixbufNonAnim_val(val) ((GtkPixbufNonAnim*)ml_gobject_ext_of_val(val))
#define Val_GtkPixbufNonAnim(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GtkPixbufNonAnim */

#ifndef Val_GdkPixbufSimpleAnim
#define GdkPixbufSimpleAnim_val(val) ((GdkPixbufSimpleAnim*)ml_gobject_ext_of_val(val))
#define Val_GdkPixbufSimpleAnim(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GdkPixbufSimpleAnim */

#ifndef Val_GtkPixbufSimpleAnimIter
#define GtkPixbufSimpleAnimIter_val(val) ((GtkPixbufSimpleAnimIter*)ml_gobject_ext_of_val(val))
#define Val_GtkPixbufSimpleAnimIter(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_GtkPixbufSimpleAnimIter */

/* Interface-specific conversion macros (shared) */
/* Value-returning structs copied into OCaml */
value copy_GdkPixbufFormat(const GdkPixbufFormat *ptr);

#ifndef Val_GdkPixbufFormat
#define GdkPixbufFormat_val(val) ((GdkPixbufFormat*)ext_of_val(val))
#define Val_GdkPixbufFormat(obj) copy_GdkPixbufFormat((obj))
#define Val_GdkPixbufFormat_option(ptr) ((ptr) ? Val_some(copy_GdkPixbufFormat(ptr)) : Val_none)
#endif /* Val_GdkPixbufFormat */


/* Forward declarations for record converters (non-opaque records) */
/* Forward declarations for GdkPixbufModule converters */
GdkPixbufModule *GdkPixbufModule_val(value val);
value Val_GdkPixbufModule(const GdkPixbufModule *ptr);
value Val_GdkPixbufModule_option(const GdkPixbufModule *ptr);

/* Forward declarations for GdkPixbufModulePattern converters */
GdkPixbufModulePattern *GdkPixbufModulePattern_val(value val);
value Val_GdkPixbufModulePattern(const GdkPixbufModulePattern *ptr);
value Val_GdkPixbufModulePattern_option(const GdkPixbufModulePattern *ptr);

/* Const-safe string extraction for setters */
#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar *)(expr)

/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */

/* Forward declarations for enum converters */
value Val_GdkPixbufColorspace(GdkColorspace val);
GdkColorspace GdkPixbufColorspace_val(value val);
value Val_GdkPixbufInterpType(GdkInterpType val);
GdkInterpType GdkPixbufInterpType_val(value val);
value Val_GdkPixbufPixbufAlphaMode(GdkPixbufAlphaMode val);
GdkPixbufAlphaMode GdkPixbufPixbufAlphaMode_val(value val);
value Val_GdkPixbufPixbufError(GdkPixbufError val);
GdkPixbufError GdkPixbufPixbufError_val(value val);
value Val_GdkPixbufPixbufRotation(GdkPixbufRotation val);
GdkPixbufRotation GdkPixbufPixbufRotation_val(value val);

/* Forward declarations for bitfield converters */
value Val_GdkPixbufPixbufFormatFlags(GdkPixbufFormatFlags flags);
GdkPixbufFormatFlags GdkPixbufPixbufFormatFlags_val(value list);


#endif /* _gtk4_generated_forward_decls_ */
