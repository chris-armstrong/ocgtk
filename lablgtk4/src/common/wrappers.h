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

#include <glib.h>
#include <glib-object.h>

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
/* GObject helpers with automatic reference counting                   */
/* ==================================================================== */

/* Wrap a GObject in a custom block with automatic g_object_unref finalizer.
 * IMPORTANT: This function does NOT modify refcount - caller must handle
 * refcounting based on transfer-ownership attribute:
 *   - transfer-ownership="none": call g_object_ref_sink() before wrapping
 *   - transfer-ownership="floating": call g_object_ref_sink() before wrapping
 *   - transfer-ownership="full": pass directly (we already own the reference)
 */
CAMLexport value ml_gobject_val_of_ext(const void *gobject);

/* Extract GObject pointer from custom block */
CAMLexport void* ml_gobject_ext_of_val(const value val);

/* Nullable GObject variant - returns Val_none for NULL */
CAMLexport value ml_gobject_val_of_ext_option(const void *gobject);

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
/* Abstract value conversions (common for all libraries) */
/* ==================================================================== */

CAMLexport value val_of_ext(const void *ext);
CAMLexport void* ext_of_val(const value val);

/* ==================================================================== */
/* GObject/GLib Type Conversions (common for all libraries) */
/* ==================================================================== */

/* GObject - use direct cast */
#define GObject_val(val) ((GObject*)(ext_of_val(val)))
#define Val_GObject(obj) (val_of_ext(obj))

/* GClosure - custom block with finalizer (defined in ml_gobject.c) */
#define GClosure_val(val) (*((GClosure**)Data_custom_val(val)))

/* GType */
#define GType_val(val) ((GType)Long_val(val))
#define Val_GType(t) (Val_long(t))

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

/* ==================================================================== */
/* GValue */
/* ==================================================================== */

CAMLprim GValue *GValue_val(value val);

#endif /* _gtk4_wrappers_ */
