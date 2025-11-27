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

/* For value blocks containing copied C structs */
#define MLPointer_val(val) \
        ((int)Field(val,1) == 2 ? &Field(val,2) : (void*)Field(val,1))

/* Helper for creating OCaml values from C structs */
CAMLexport value copy_memblock_indirected(void *src, asize_t size);
#define Val_copy(val) copy_memblock_indirected(&val, sizeof(val))

/* ==================================================================== */
/* GIR record helpers                                                   */
/* ==================================================================== */

/* Allocate a heap copy of a C record and wrap it in a custom block
 * that frees the copy with g_free when collected.
 */
CAMLexport value ml_gir_record_alloc(const void *src, size_t size, const char *type_name, void *(*copy_fn)(const void *));

/* Extract a C pointer from a custom block created by ml_gir_record_alloc,
 * with a fallback to ext_of_val for older representations.
 */
CAMLexport void *ml_gir_record_ptr_val(value v, const char *type_name);

/* ==================================================================== */
/* Pointer Wrapping (OCaml 5.0+ compatible) */
/* ==================================================================== */

/* Wrap C pointers in Abstract blocks to prevent GC scanning */
CAMLexport value Val_pointer(void *ptr);
#define Pointer_val(val) ((void*)Field(val,1))

/* ==================================================================== */
/* Enums <-> Polymorphic Variants */
/* ==================================================================== */

typedef struct { value key; int data; } lookup_info;
#define Val_lookup_info(v) (val_of_ext(v))
#define Lookup_info_val(v) ((const lookup_info*)ext_of_val(v))

/* Enum conversion functions (implemented in wrappers.c) */
/* Internal C variants - accept lookup table pointers directly */
value lookup_from_c_direct (const lookup_info *table, int data);
int lookup_to_c_direct (const lookup_info *table, value key);

/* External OCaml FFI variants - accept lookup tables as OCaml values */
CAMLexport value ml_lookup_from_c (value table, value data);
CAMLexport value ml_lookup_to_c (value table, value key);

/* ==================================================================== */
/* OCaml Value Helpers */
/* ==================================================================== */

#define Val_unit Val_int(0)
/* Val_bool and Bool_val are already defined in caml/mlvalues.h */

#define Val_optstring(s) ((s) ? caml_alloc_some(caml_copy_string(s)) : Val_none)
#define Val_option_string(s) Val_optstring(s)
#define String_option_val(v) ((v) == Val_none ? NULL : String_val(Some_val(v)))

#define Val_some(v) caml_alloc_some(v)
#define Val_none Val_int(0)
#define Some_val(v) Field(v, 0)
#define Is_some(v) Is_block(v)

#define Option_val(val, unwrap, default) ((val) == Val_none ? (default) : unwrap(Some_val(val)))

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

value val_of_ext(const void *ext);
void* ext_of_val(const value val);

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

/* GtkScrolledWindow - GObject, use direct cast */
#define GtkScrolledWindow_val(val) ((GtkScrolledWindow*)(ext_of_val(val)))
#define Val_GtkScrolledWindow(obj) (val_of_ext(obj))

/* GtkFrame - GObject, use direct cast */
#define GtkFrame_val(val) ((GtkFrame*)(ext_of_val(val)))
#define Val_GtkFrame(obj) (val_of_ext(obj))

/* GObject - use direct cast */
#define GObject_val(val) ((GObject*)(ext_of_val(val)))
#define Val_GObject(obj) (val_of_ext(obj))

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

/* Result type construction for error handling */
/* OCaml result type: type ('a, 'b) result = Ok of 'a | Error of 'b */
/* Ok is tag 0, Error is tag 1 */

/* Result type construction for error handling */
/* These are defined in wrappers.c */
value Res_Ok(value v);
value Res_Error(value v);

/* Special case for unit result */
#define ValUnit Val_unit

/* Convert GError to OCaml GError.t record */
/* Defined in wrappers.c */
value Val_GError(GError *error);

/* Copies of value-returning GTK structs (stack-safe) */
value copy_GtkTreeIter(const GtkTreeIter *iter);
value copy_GtkTextIter(const GtkTextIter *iter);
value copy_GtkRequisition(const GtkRequisition *req);
value copy_GtkBorder(const GtkBorder *border);

/* ==================================================================== */
/* GValue */
/* ==================================================================== */

CAMLprim GValue *GValue_val(value val);

#endif /* _gtk4_wrappers_ */
