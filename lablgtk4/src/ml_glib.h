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

#ifndef _ML_GLIB_H_
#define _ML_GLIB_H_

#include <glib.h>
#include <caml/mlvalues.h>

/* GMainLoop wrapper */
#define GMainLoop_val(val) ((GMainLoop*)Pointer_val(val))
#define Val_GMainLoop(obj) (Val_pointer(obj))

/* List conversion functions (declared in wrappers.h but implemented in ml_glib.c) */
/* These are exported for use by other modules */

/* Error handling */
CAMLprim void ml_raise_gerror(GError *err);

#endif /* _ML_GLIB_H_ */
