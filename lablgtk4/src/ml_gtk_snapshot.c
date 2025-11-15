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
#include <caml/callback.h>
#include <caml/fail.h>

#include "wrappers.h"

/* Snapshot type conversion */
#define GtkSnapshot_val(val) ((GtkSnapshot*)Pointer_val(val))
#define Val_GtkSnapshot(obj) (Val_pointer(obj))

/* Helper to extract Graphene Point from OCaml record */
static void graphene_point_from_value(graphene_point_t *point, value v)
{
    point->x = Double_field(v, 0);
    point->y = Double_field(v, 1);
}

/* Helper to extract Graphene Rect from OCaml record */
static void graphene_rect_from_value(graphene_rect_t *rect, value v)
{
    rect->origin.x = Double_field(v, 0);
    rect->origin.y = Double_field(v, 1);
    rect->size.width = Double_field(v, 2);
    rect->size.height = Double_field(v, 3);
}

/* Helper to extract GdkRGBA from OCaml record */
static void gdk_rgba_from_value(GdkRGBA *rgba, value v)
{
    rgba->red = Double_field(v, 0);
    rgba->green = Double_field(v, 1);
    rgba->blue = Double_field(v, 2);
    rgba->alpha = Double_field(v, 3);
}

/* ========== Cairo Integration ========== */

CAMLprim value ml_gtk_snapshot_append_cairo(value snapshot, value width, value height)
{
    CAMLparam3(snapshot, width, height);
    CAMLlocal1(result);

    graphene_rect_t bounds;
    graphene_rect_init(&bounds, 0, 0, Double_val(width), Double_val(height));

    cairo_t *cr = gtk_snapshot_append_cairo(
        GtkSnapshot_val(snapshot),
        &bounds
    );

    /* Security: Check for NULL pointer */
    if (cr == NULL) {
        caml_failwith("gtk_snapshot_append_cairo returned NULL");
    }

    /* Return Cairo context - cairo2 library expects cairo_t* as value */
    result = (value)cr;

    CAMLreturn(result);
}

/* ========== Basic Rendering ========== */

CAMLprim value ml_gtk_snapshot_append_color(value snapshot, value color, value bounds)
{
    CAMLparam3(snapshot, color, bounds);

    GdkRGBA gdk_color;
    graphene_rect_t rect;

    /* Extract color and bounds from OCaml records */
    gdk_rgba_from_value(&gdk_color, color);
    graphene_rect_from_value(&rect, bounds);

    gtk_snapshot_append_color(
        GtkSnapshot_val(snapshot),
        &gdk_color,
        &rect
    );

    CAMLreturn(Val_unit);
}

/* ========== Transformations ========== */

ML_1 (gtk_snapshot_save, GtkSnapshot_val, Unit)
ML_1 (gtk_snapshot_restore, GtkSnapshot_val, Unit)

CAMLprim value ml_gtk_snapshot_translate(value snapshot, value point)
{
    CAMLparam2(snapshot, point);

    graphene_point_t pt;
    graphene_point_from_value(&pt, point);

    gtk_snapshot_translate(GtkSnapshot_val(snapshot), &pt);

    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_snapshot_scale(value snapshot, value factor_x, value factor_y)
{
    CAMLparam3(snapshot, factor_x, factor_y);

    gtk_snapshot_scale(
        GtkSnapshot_val(snapshot),
        Double_val(factor_x),
        Double_val(factor_y)
    );

    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_snapshot_rotate(value snapshot, value angle)
{
    CAMLparam2(snapshot, angle);

    gtk_snapshot_rotate(GtkSnapshot_val(snapshot), Double_val(angle));

    CAMLreturn(Val_unit);
}

/* ========== Clipping ========== */

CAMLprim value ml_gtk_snapshot_push_clip(value snapshot, value bounds)
{
    CAMLparam2(snapshot, bounds);

    graphene_rect_t rect;
    graphene_rect_from_value(&rect, bounds);

    gtk_snapshot_push_clip(GtkSnapshot_val(snapshot), &rect);

    CAMLreturn(Val_unit);
}

ML_1 (gtk_snapshot_pop, GtkSnapshot_val, Unit)

/* ========== Opacity ========== */

CAMLprim value ml_gtk_snapshot_push_opacity(value snapshot, value opacity)
{
    CAMLparam2(snapshot, opacity);

    gtk_snapshot_push_opacity(GtkSnapshot_val(snapshot), Double_val(opacity));

    CAMLreturn(Val_unit);
}
