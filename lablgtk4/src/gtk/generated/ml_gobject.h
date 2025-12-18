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

#ifndef _ML_GOBJECT_H_
#define _ML_GOBJECT_H_

#include <glib-object.h>
#include <caml/mlvalues.h>

/* GValue conversion - defined in wrappers.h but declared here for visibility */
CAMLprim GValue *GValue_val(value val);

/* Helper macros for GObject */
#define check_cast(f,v) (G_TYPE_CHECK_INSTANCE_CAST((GObject_val(v)),f,GObject))

#endif /* _ML_GOBJECT_H_ */
