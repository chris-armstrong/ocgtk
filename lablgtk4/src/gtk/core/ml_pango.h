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

/* Pango type definitions for GTK4 - Phase 2.5 */

#ifndef _ML_PANGO_H_
#define _ML_PANGO_H_

#include "generated_forward_decls.h"

/* Val_PangoRectangle is exported for use in layout functions */
CAMLexport value Val_PangoRectangle(PangoRectangle *rect);

#endif /* _ML_PANGO_H_ */
