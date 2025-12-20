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

value copy_GtkTreeIter(const GtkTreeIter *iter) {
    return ml_gir_record_alloc(iter, sizeof(GtkTreeIter), "GtkTreeIter", (void *(*)(const void *))gtk_tree_iter_copy);
}

value copy_GtkTextIter(const GtkTextIter *iter) {
    return ml_gir_record_alloc(iter, sizeof(GtkTextIter), "GtkTextIter", (void *(*)(const void *))gtk_text_iter_copy);
}

value copy_GtkRequisition(const GtkRequisition *req) {
    return ml_gir_record_alloc(req, sizeof(GtkRequisition), "GtkRequisition", (void *(*)(const void *))gtk_requisition_copy);
}

value copy_GtkBorder(const GtkBorder *border) {
    return ml_gir_record_alloc(border, sizeof(GtkBorder), "GtkBorder", (void *(*)(const void *))gtk_border_copy);
}
