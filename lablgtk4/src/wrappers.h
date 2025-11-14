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

#ifndef _gtk4_wrappers_
#define _gtk4_wrappers_

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/custom.h>

#include <gtk/gtk.h>

/* ==================================================================== */
/* Basic Pointer Conversions */
/* ==================================================================== */

#define Pointer_val(val) ((void*)Field(val,1))
#define Val_pointer(p) ((value)(p))

/* For value blocks containing copied C structs */
#define MLPointer_val(val) \
        ((int)Field(val,1) == 2 ? &Field(val,2) : (void*)Field(val,1))

/* Helper for creating OCaml values from C structs */
CAMLexport value copy_memblock_indirected(void *src, asize_t size);
#define Val_copy(val) copy_memblock_indirected(&val, sizeof(val))

/* ==================================================================== */
/* Enums <-> Polymorphic Variants */
/* ==================================================================== */

typedef struct { value key; int data; } lookup_info;
#define Val_lookup_info(v) Val_pointer((void*)v)
#define Lookup_info_val(v) ((const lookup_info*)Pointer_val(v))

/* Enum conversion functions (implemented in wrappers.c) */
CAMLexport value ml_lookup_from_c (const lookup_info table[], int data);
CAMLexport int ml_lookup_to_c (const lookup_info table[], value key);

/* ==================================================================== */
/* OCaml Value Helpers */
/* ==================================================================== */

#define Val_unit Val_int(0)
/* Val_bool and Bool_val are already defined in caml/mlvalues.h */

#define Val_optstring(s) ((s) ? caml_alloc_some(caml_copy_string(s)) : Val_none)
#define String_option_val(v) ((v) == Val_none ? NULL : String_val(Some_val(v)))

#define Val_some(v) caml_alloc_some(v)
#define Val_none Val_int(0)
#define Some_val(v) Field(v, 0)

#define Val_emptylist Val_int(0)

/* Helper macro for option types */
#define Val_option(ptr, wrapper) ((ptr) ? Val_some(wrapper(ptr)) : Val_none)

/* Helper macro to generate Val_option_T functions */
#define Make_Val_option(T) \
value Val_option_##T(T* v) { return v ? Val_some(Val_##T(v)) : Val_none; }

/* Helper macros for wrapping C functions */
#define Ignore(x)
#define Unit(x) (((void)x), Val_unit)

#define ML_1(cname, conv1, conv) \
CAMLprim value ml_##cname (value arg1) { return conv (cname (conv1 (arg1))); }

#define ML_2(cname, conv1, conv2, conv) \
CAMLprim value ml_##cname (value arg1, value arg2) { return conv (cname (conv1(arg1), conv2(arg2))); }

#define ML_4(cname, conv1, conv2, conv3, conv4, conv) \
CAMLprim value ml_##cname (value arg1, value arg2, value arg3, value arg4) { return conv (cname (conv1(arg1), conv2(arg2), conv3(arg3), conv4(arg4))); }

#define ML_5(cname, conv1, conv2, conv3, conv4, conv5, conv) \
CAMLprim value ml_##cname (value arg1, value arg2, value arg3, value arg4, value arg5) \
{ return conv (cname (conv1(arg1), conv2(arg2), conv3(arg3), conv4(arg4), conv5(arg5))); }

#define ML_8(cname, conv1, conv2, conv3, conv4, conv5, conv6, conv7, conv8, conv) \
CAMLprim value ml_##cname (value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7, value arg8) \
{ return conv (cname (conv1(arg1), conv2(arg2), conv3(arg3), conv4(arg4), conv5(arg5), conv6(arg6), conv7(arg7), conv8(arg8))); }

#define ML_11(cname, conv1, conv2, conv3, conv4, conv5, conv6, conv7, conv8, conv9, conv10, conv11, conv) \
CAMLprim value ml_##cname (value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7, value arg8, value arg9, value arg10, value arg11) \
{ return conv (cname (conv1(arg1), conv2(arg2), conv3(arg3), conv4(arg4), conv5(arg5), conv6(arg6), conv7(arg7), conv8(arg8), conv9(arg9), conv10(arg10), conv11(arg11))); }

#define ML_12(cname, conv1, conv2, conv3, conv4, conv5, conv6, conv7, conv8, conv9, conv10, conv11, conv12, conv) \
CAMLprim value ml_##cname (value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7, value arg8, value arg9, value arg10, value arg11, value arg12) \
{ return conv (cname (conv1(arg1), conv2(arg2), conv3(arg3), conv4(arg4), conv5(arg5), conv6(arg6), conv7(arg7), conv8(arg8), conv9(arg9), conv10(arg10), conv11(arg11), conv12(arg12))); }

/* Bytecode variants for functions with >5 args */
#define ML_bc8(fname) \
CAMLprim value fname##_bc(value *argv, int argn) \
{ return fname(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]); }

#define ML_bc11(fname) \
CAMLprim value fname##_bc(value *argv, int argn) \
{ return fname(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10]); }

#define ML_bc12(fname) \
CAMLprim value fname##_bc(value *argv, int argn) \
{ return fname(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10], argv[11]); }

/* ==================================================================== */
/* GTK4/GDK4 Type Conversions */
/* ==================================================================== */

/* GdkSurface (was GdkWindow in GTK3) - GObject, use direct cast */
#define GdkSurface_val(val) ((GdkSurface*)(val))
#define Val_GdkSurface(obj) ((value)(obj))

/* GdkDisplay - GObject, use direct cast */
#define GdkDisplay_val(val) ((GdkDisplay*)(val))
#define Val_GdkDisplay(obj) ((value)(obj))

/* GdkSeat (new in GDK4) - GObject, use direct cast */
#define GdkSeat_val(val) ((GdkSeat*)(val))
#define Val_GdkSeat(obj) ((value)(obj))

/* GdkDevice - GObject, use direct cast */
#define GdkDevice_val(val) ((GdkDevice*)(val))
#define Val_GdkDevice(obj) ((value)(obj))

/* GdkRGBA - simple struct, copied by value */
#define GdkRGBA_val(val) ((GdkRGBA*)MLPointer_val(val))
/* Val_GdkRGBA: Use Val_copy(rgba) for stack-allocated GdkRGBA */

/* GdkCursor - GObject, use direct cast */
#define GdkCursor_val(val) ((GdkCursor*)(val))
#define Val_GdkCursor(obj) ((value)(obj))

/* GtkWidget - GObject, use direct cast */
#define GtkWidget_val(val) ((GtkWidget*)(val))
#define Val_GtkWidget(obj) ((value)(obj))

/* GtkWindow - GObject, use direct cast */
#define GtkWindow_val(val) ((GtkWindow*)(val))
#define Val_GtkWindow(obj) ((value)(obj))

/* GObject - use direct cast */
#define GObject_val(val) ((GObject*)(val))
#define Val_GObject(obj) ((value)(obj))

/* GClosure - custom block with finalizer (defined in ml_gobject.c) */
#define GClosure_val(val) (*((GClosure**)Data_custom_val(val)))

/* GType */
#define GType_val(val) ((GType)Long_val(val))
#define Val_GType(t) (Val_long(t))

/* GdkPixbuf */
#define GdkPixbuf_val(val) (*(GdkPixbuf**)Data_custom_val(val))
value Val_GdkPixbuf_(GdkPixbuf *pb, gboolean ref);
#define Val_GdkPixbuf(pb) (Val_GdkPixbuf_((pb), TRUE))
#define Val_GdkPixbuf_new(pb) (Val_GdkPixbuf_((pb), FALSE))

/* ==================================================================== */
/* Pango Type Conversions */
/* ==================================================================== */

/* Pango GObject types - use direct cast */
#define PangoContext_val(val) ((PangoContext*)(val))
#define Val_PangoContext(obj) ((value)(obj))

#define PangoLayout_val(val) ((PangoLayout*)(val))
#define Val_PangoLayout(obj) ((value)(obj))

#define PangoFont_val(val) ((PangoFont*)(val))
#define Val_PangoFont(obj) ((value)(obj))

#define PangoFontMap_val(val) ((PangoFontMap*)(val))
#define Val_PangoFontMap(obj) ((value)(obj))

/* Pango boxed types - custom blocks */
#define PangoFontDescription_val(val) (*(PangoFontDescription**)Data_custom_val(val))
value Val_PangoFontDescription_new(PangoFontDescription *fd);
value Val_PangoFontDescription(PangoFontDescription *fd);

#define PangoFontMetrics_val(val) (*(PangoFontMetrics**)Data_custom_val(val))
value Val_PangoFontMetrics_new(PangoFontMetrics *fm);

/* PangoLanguage - simple pointer (const static data) */
#define PangoLanguage_val(val) ((PangoLanguage*)val)
#define Val_PangoLanguage(lang) ((value)(lang))

/* ==================================================================== */
/* String Utilities */
/* ==================================================================== */

value copy_string_check(const char *str);
value copy_string_g_free(char *str);
value copy_string_v(const gchar * const *v);

/* ==================================================================== */
/* List Conversions */
/* ==================================================================== */

/* GList conversions */
CAMLprim value Val_GList(GList *list, value (*func)(gpointer));
CAMLprim value Val_GList_free(GList *list, value (*func)(gpointer));
CAMLprim GList *GList_val(value list, gpointer (*func)(value));

/* GSList conversions */
CAMLprim value Val_GSList(GSList *list, value (*func)(gpointer));
CAMLprim value Val_GSList_free(GSList *list, value (*func)(gpointer));
CAMLprim GSList *GSList_val(value list, gpointer (*func)(value));

/* ==================================================================== */
/* Error Handling */
/* ==================================================================== */

CAMLprim void ml_raise_gerror(GError *err);

/* ==================================================================== */
/* GValue */
/* ==================================================================== */

CAMLprim GValue *GValue_val(value val);

#endif /* _gtk4_wrappers_ */
