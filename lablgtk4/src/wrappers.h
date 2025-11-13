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

/* Pointer conversions */
#define Pointer_val(val) ((void*)Field(val,1))
#define Val_pointer(p) ((value)(p))

/* Enums <-> polymorphic variants */
typedef struct { value key; int data; } lookup_info;
#define Val_lookup_info(v) Val_pointer((void*)v)
#define Lookup_info_val(v) ((const lookup_info*)Pointer_val(v))

/* These functions are implemented in ml_glib.c */
CAMLexport value ml_lookup_from_c (const lookup_info table[], int data);
CAMLexport int ml_lookup_to_c (const lookup_info table[], value key);

#endif /* _gtk4_wrappers_ */
