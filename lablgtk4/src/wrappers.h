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

/* ==================================================================== */
/* GTK4/GDK4 Type Conversions */
/* ==================================================================== */

/* GdkSurface (was GdkWindow in GTK3) */
#define GdkSurface_val(val) ((GdkSurface*)Pointer_val(val))
#define Val_GdkSurface(obj) (Val_pointer(obj))

/* GtkWidget */
#define GtkWidget_val(val) ((GtkWidget*)Pointer_val(val))
#define Val_GtkWidget(obj) (Val_pointer(obj))

/* GtkWindow */
#define GtkWindow_val(val) ((GtkWindow*)Pointer_val(val))
#define Val_GtkWindow(obj) (Val_pointer(obj))

/* GObject */
#define GObject_val(val) ((GObject*)Pointer_val(val))
#define Val_GObject(obj) (Val_pointer(obj))

/* GClosure */
#define GClosure_val(val) ((GClosure*)Pointer_val(val))
#define Val_GClosure(obj) (Val_pointer(obj))

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

/* ==================================================================== */
/* GValue */
/* ==================================================================== */

CAMLprim GValue *GValue_val(value val);

#endif /* _gtk4_wrappers_ */
