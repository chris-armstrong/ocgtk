/**************************************************************************/
/*                ocgtk - OCaml bindings for GTK4                         */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License version 2, as published by the           */
/*    Free Software Foundation with the exception described in file       */
/*    COPYING which comes with the library.                               */
/*                                                                        */
/*    Based on lablgtk3 /https://github.com/garrigue/lablgtk/             */
/*                                                                        */
/**************************************************************************/

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>

#include "wrappers.h"
#include "converters.h"

/* ==================================================================== */
/* GTK Widget Option Type Converter */
/* ==================================================================== */

CAMLexport value Val_GtkWidget_option(GtkWidget *widget) {
    CAMLparam0();
    if (widget == NULL) CAMLreturn(Val_none);
    CAMLreturn(Val_some(val_of_ext(widget)));
}

/* ==================================================================== */
/* Copies for value-returning GTK structs                              */
/* ==================================================================== */

/* Value-like record copy functions are now generated in ml_*_record_gen.c files */
