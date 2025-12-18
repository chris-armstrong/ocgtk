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

#ifndef _ML_GDK_H_
#define _ML_GDK_H_

#include <caml/mlvalues.h>

/* Error handling */
CAMLprim void ml_raise_gdk(const char *errmsg);

/* Helper macros for option types */
#define Val_option(val, wrap) ((val) ? Val_some(wrap(val)) : Val_none)

#endif /* _ML_GDK_H_ */
