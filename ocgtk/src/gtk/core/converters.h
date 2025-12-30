/**************************************************************************/
/*                ocgtk - OCaml bindings for GTK4                         */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License version 2, as published by the           */
/*    Free Software Foundation with the exception described in file       */
/*    COPYING which comes with the library.                               */
/*                                                                        */
/*    Based on lablgtk3 /https://github.com/garrigue/lablgtk/             */
/*                                                                        */
/**************************************************************************/

#ifndef _gtk4_converters_
#define _gtk4_converters_

#include <caml/mlvalues.h>
#include <gtk/gtk.h>
#include "wrappers.h"

/* ==================================================================== */
/* GTK4/GDK4 Type Conversions */
/* ==================================================================== */

/* GdkSurface (was GdkWindow in GTK3) - GObject, use direct cast */
#define GdkSurface_val(val) ((GdkSurface*)(ext_of_val(val)))
#define Val_GdkSurface(obj) (val_of_ext(obj))

/* GdkDisplay - GObject, use direct cast */
#define GdkDisplay_val(val) ((GdkDisplay*)(ext_of_val(val)))
#define Val_GdkDisplay(obj) (val_of_ext(obj))

/* GdkSeat (new in GDK4) - GObject, use direct cast */
#define GdkSeat_val(val) ((GdkSeat*)(ext_of_val(val)))
#define Val_GdkSeat(obj) (val_of_ext(obj))

/* GdkDevice - GObject, use direct cast */
#define GdkDevice_val(val) ((GdkDevice*)(ext_of_val(val)))
#define Val_GdkDevice(obj) (val_of_ext(obj))

/* GdkRGBA - simple struct, copied by value */
#define GdkRGBA_val(val) ((GdkRGBA*)MLPointer_val(val))
/* Val_GdkRGBA: Use Val_copy(rgba) for stack-allocated GdkRGBA */

/* GdkCursor - GObject, use direct cast */
#define GdkCursor_val(val) ((GdkCursor*)(ext_of_val(val)))
#define Val_GdkCursor(obj) (val_of_ext(obj))

/* ==================================================================== */
/* Pango Type Conversions */
/* ==================================================================== */

/* Pango GObject types - OCaml 5.0+ requires proper wrapping */
#define PangoContext_val(val) ((PangoContext*)ext_of_val(val))
#define Val_PangoContext(obj) (val_of_ext(obj))

#define PangoLayout_val(val) ((PangoLayout*)ext_of_val(val))
#define Val_PangoLayout(obj) (val_of_ext(obj))

#define PangoFont_val(val) ((PangoFont*)ext_of_val(val))
#define Val_PangoFont(obj) (val_of_ext(obj))

#define PangoFontMap_val(val) ((PangoFontMap*)ext_of_val(val))
#define Val_PangoFontMap(obj) (val_of_ext(obj))

/* Pango boxed types - custom blocks */
#define PangoFontDescription_val(val) (*(PangoFontDescription**)Data_custom_val(val))
value Val_PangoFontDescription_new(PangoFontDescription *fd);
value Val_PangoFontDescription(PangoFontDescription *fd);

#define PangoFontMetrics_val(val) (*(PangoFontMetrics**)Data_custom_val(val))
value Val_PangoFontMetrics_new(PangoFontMetrics *fm);

/* PangoLanguage - simple pointer (const static data), OCaml 5.0+ compliant */
#define PangoLanguage_val(val) ((PangoLanguage*)ext_of_val(val))
#define Val_PangoLanguage(lang) (val_of_ext((void*)(lang)))

/* ==================================================================== */
/* GTK Copy Functions */
/* ==================================================================== */

/* Copies of value-returning GTK structs (stack-safe) */
/* These are now declared in generated_forward_decls.h and implemented in ml_*_record_gen.c */

#endif /* _gtk4_converters_ */
