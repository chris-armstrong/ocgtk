/**************************************************************************/
/*                LablGTK4 - OCaml bindings for GTK4                      */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
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
/* Non-opaque GTK record conversions (heap copies with g_free finalizer) */
/* ==================================================================== */

#define GtkTreeIter_val(v) ((GtkTreeIter*)ml_gir_record_ptr_val((v), "GtkTreeIter"))
#define Val_GtkTreeIter_ptr(ptr) ml_gir_record_alloc((ptr), sizeof(GtkTreeIter), "GtkTreeIter", (void *(*)(const void *))gtk_tree_iter_copy)
#define Val_GtkTreeIter(obj) Val_GtkTreeIter_ptr(&(obj))
#define Val_GtkTreeIter_option(ptr) ((ptr) ? Val_some(Val_GtkTreeIter_ptr(ptr)) : Val_none)

#define GtkTextIter_val(v) ((GtkTextIter*)ml_gir_record_ptr_val((v), "GtkTextIter"))
#define Val_GtkTextIter_ptr(ptr) ml_gir_record_alloc((ptr), sizeof(GtkTextIter), "GtkTextIter", (void *(*)(const void *))gtk_text_iter_copy)
#define Val_GtkTextIter(obj) Val_GtkTextIter_ptr(&(obj))
#define Val_GtkTextIter_option(ptr) ((ptr) ? Val_some(Val_GtkTextIter_ptr(ptr)) : Val_none)

#define GtkRequisition_val(v) ((GtkRequisition*)ml_gir_record_ptr_val((v), "GtkRequisition"))
#define Val_GtkRequisition_ptr(ptr) ml_gir_record_alloc((ptr), sizeof(GtkRequisition), "GtkRequisition", (void *(*)(const void *))gtk_requisition_copy)
#define Val_GtkRequisition(obj) Val_GtkRequisition_ptr(&(obj))
#define Val_GtkRequisition_option(ptr) ((ptr) ? Val_some(Val_GtkRequisition_ptr(ptr)) : Val_none)

#define GtkBorder_val(v) ((GtkBorder*)ml_gir_record_ptr_val((v), "GtkBorder"))
#define Val_GtkBorder_ptr(ptr) ml_gir_record_alloc((ptr), sizeof(GtkBorder), "GtkBorder", (void *(*)(const void *))gtk_border_copy)
#define Val_GtkBorder(obj) Val_GtkBorder_ptr(&(obj))
#define Val_GtkBorder_option(ptr) ((ptr) ? Val_some(Val_GtkBorder_ptr(ptr)) : Val_none)

#define GtkBitsetIter_val(v) ((GtkBitsetIter*)ml_gir_record_ptr_val((v), "GtkBitsetIter"))
#define Val_GtkBitsetIter_ptr(ptr) ml_gir_record_alloc((ptr), sizeof(GtkBitsetIter), "GtkBitsetIter", NULL)
#define Val_GtkBitsetIter(obj) Val_GtkBitsetIter_ptr(&(obj))

/* GdkClipboard (new in GTK4) - GObject, use direct cast */
#define GdkClipboard_val(val) ((GdkClipboard*)(ext_of_val(val)))
#define Val_GdkClipboard(obj) (val_of_ext(obj))

/* GdkContentProvider (new in GTK4) - GObject, use direct cast */
#define GdkContentProvider_val(val) ((GdkContentProvider*)(ext_of_val(val)))
#define Val_GdkContentProvider(obj) (val_of_ext(obj))

/* GtkWidget - GObject, use direct cast */
#define GtkWidget_val(val) ((GtkWidget*)(ext_of_val(val)))
#define Val_GtkWidget(obj) (val_of_ext(obj))
CAMLexport value Val_GtkWidget_option(GtkWidget *obj);

/* GtkWindow - GObject, use direct cast */
#define GtkWindow_val(val) ((GtkWindow*)(ext_of_val(val)))
#define Val_GtkWindow(obj) (val_of_ext(obj))

/* GtkRoot - Interface, use direct cast */
#define GtkRoot_val(val) ((GtkRoot*)(ext_of_val(val)))
#define Val_GtkRoot(obj) (val_of_ext(obj))

/* GtkNative - Interface, use direct cast */
#define GtkNative_val(val) ((GtkNative*)(ext_of_val(val)))
#define Val_GtkNative(obj) (val_of_ext(obj))

/* GtkStyleProvider - Interface, use direct cast */
#define GtkStyleProvider_val(val) ((GtkStyleProvider*)(ext_of_val(val)))
#define Val_GtkStyleProvider(obj) (val_of_ext(obj))

/* GtkScrolledWindow - GObject, use direct cast */
#define GtkScrolledWindow_val(val) ((GtkScrolledWindow*)(ext_of_val(val)))
#define Val_GtkScrolledWindow(obj) (val_of_ext(obj))

/* GtkFrame - GObject, use direct cast */
#define GtkFrame_val(val) ((GtkFrame*)(ext_of_val(val)))
#define Val_GtkFrame(obj) (val_of_ext(obj))

/* GdkPixbuf */
#define GdkPixbuf_val(val) (*(GdkPixbuf**)Data_custom_val(val))
value Val_GdkPixbuf_(GdkPixbuf *pb, gboolean ref);
#define Val_GdkPixbuf(pb) (Val_GdkPixbuf_((pb), TRUE))
#define Val_GdkPixbuf_new(pb) (Val_GdkPixbuf_((pb), FALSE))

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
value copy_GtkTreeIter(const GtkTreeIter *iter);
value copy_GtkTextIter(const GtkTextIter *iter);
value copy_GtkRequisition(const GtkRequisition *req);
value copy_GtkBorder(const GtkBorder *border);

#endif /* _gtk4_converters_ */
