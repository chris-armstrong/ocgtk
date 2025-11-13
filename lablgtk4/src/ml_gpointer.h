/**************************************************************************/
/*                Lablgtk                                                 */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/**************************************************************************/

#ifndef _ML_GPOINTER_H_
#define _ML_GPOINTER_H_

#include <caml/mlvalues.h>

/* Pointer wrapping macros */
#define Pointer_val(val) ((void*)Field(val,1))
#define Val_pointer(p) ((value)(p))

/* Variant table type for enum conversions */
typedef struct { value key; int data; } lookup_info;

/* Variant conversion functions (implemented in wrappers.c) */
CAMLexport value ml_lookup_from_c(const lookup_info table[], int data);
CAMLexport int ml_lookup_to_c(const lookup_info table[], value key);

#endif /* _ML_GPOINTER_H_ */
