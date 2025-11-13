/**************************************************************************/
/*                Lablgtk                                                 */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/*    This program is distributed in the hope that it will be useful,     */
/*    but WITHOUT ANY WARRANTY; without even the implied warranty of      */
/*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the       */
/*    GNU Library General Public License for more details.                */
/*                                                                        */
/*    You should have received a copy of the GNU Library General          */
/*    Public License along with this program; if not, write to the        */
/*    Free Software Foundation, Inc., 59 Temple Place, Suite 330,         */
/*    Boston, MA 02111-1307  USA                                          */
/*                                                                        */
/**************************************************************************/

/**
 * ml_gdk.c - GDK4 C bindings
 *
 * MAJOR CHANGES FROM GDK3:
 * - GdkWindow → GdkSurface
 * - GdkScreen removed (merged into GdkDisplay)
 * - GdkDeviceManager removed (use GdkSeat)
 * - Event system simplified
 */

#include <string.h>
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>

#include "wrappers.h"
#include "ml_gobject.h"
#include "ml_glib.h"
#include "gdk4_tags.h"

/* Error handling */
CAMLprim void ml_raise_gdk(const char *errmsg)
{
    static const value *exn = NULL;
    if (exn == NULL)
        exn = caml_named_value("gdkerror");
    if (exn != NULL)
        caml_raise_with_string(*exn, (char*)errmsg);
    else
        caml_failwith(errmsg);
}

/* ========================================================================= */
/* Display functions                                                         */
/* ========================================================================= */

CAMLprim value ml_gdk_display_get_default(value unit)
{
    CAMLparam1(unit);
    GdkDisplay *display = gdk_display_get_default();
    CAMLreturn(Val_option(display, Val_GdkDisplay));
}

CAMLprim value ml_gdk_display_get_name(value display_val)
{
    CAMLparam1(display_val);
    GdkDisplay *display = GdkDisplay_val(display_val);
    const char *name = gdk_display_get_name(display);
    CAMLreturn(caml_copy_string(name ? name : ""));
}

CAMLprim value ml_gdk_display_get_default_seat(value display_val)
{
    CAMLparam1(display_val);
    GdkDisplay *display = GdkDisplay_val(display_val);
    GdkSeat *seat = gdk_display_get_default_seat(display);
    CAMLreturn(Val_option(seat, Val_GdkSeat));
}

CAMLprim value ml_gdk_display_beep(value display_val)
{
    CAMLparam1(display_val);
    GdkDisplay *display = GdkDisplay_val(display_val);
    gdk_display_beep(display);
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gdk_display_flush(value display_val)
{
    CAMLparam1(display_val);
    GdkDisplay *display = GdkDisplay_val(display_val);
    gdk_display_flush(display);
    CAMLreturn(Val_unit);
}

/* ========================================================================= */
/* Seat functions (new in GDK4)                                              */
/* ========================================================================= */

CAMLprim value ml_gdk_seat_get_pointer(value seat_val)
{
    CAMLparam1(seat_val);
    GdkSeat *seat = GdkSeat_val(seat_val);
    GdkDevice *device = gdk_seat_get_pointer(seat);
    CAMLreturn(Val_option(device, Val_GdkDevice));
}

CAMLprim value ml_gdk_seat_get_keyboard(value seat_val)
{
    CAMLparam1(seat_val);
    GdkSeat *seat = GdkSeat_val(seat_val);
    GdkDevice *device = gdk_seat_get_keyboard(seat);
    CAMLreturn(Val_option(device, Val_GdkDevice));
}

CAMLprim value ml_gdk_seat_get_display(value seat_val)
{
    CAMLparam1(seat_val);
    GdkSeat *seat = GdkSeat_val(seat_val);
    GdkDisplay *display = gdk_seat_get_display(seat);
    CAMLreturn(Val_GdkDisplay(display));
}

/* ========================================================================= */
/* Device functions                                                          */
/* ========================================================================= */

CAMLprim value ml_gdk_device_get_name(value device_val)
{
    CAMLparam1(device_val);
    GdkDevice *device = GdkDevice_val(device_val);
    const char *name = gdk_device_get_name(device);
    CAMLreturn(caml_copy_string(name ? name : ""));
}

CAMLprim value ml_gdk_device_get_source(value device_val)
{
    CAMLparam1(device_val);
    GdkDevice *device = GdkDevice_val(device_val);
    GdkInputSource source = gdk_device_get_source(device);
    CAMLreturn(Val_gdk4_input_source(source));
}

CAMLprim value ml_gdk_device_get_seat(value device_val)
{
    CAMLparam1(device_val);
    GdkDevice *device = GdkDevice_val(device_val);
    GdkSeat *seat = gdk_device_get_seat(device);
    CAMLreturn(Val_GdkSeat(seat));
}

CAMLprim value ml_gdk_device_get_display(value device_val)
{
    CAMLparam1(device_val);
    GdkDevice *device = GdkDevice_val(device_val);
    GdkDisplay *display = gdk_device_get_display(device);
    CAMLreturn(Val_GdkDisplay(display));
}

/* ========================================================================= */
/* Surface functions (was GdkWindow in GDK3)                                 */
/* ========================================================================= */

CAMLprim value ml_gdk_surface_get_display(value surface_val)
{
    CAMLparam1(surface_val);
    GdkSurface *surface = GdkSurface_val(surface_val);
    GdkDisplay *display = gdk_surface_get_display(surface);
    CAMLreturn(Val_GdkDisplay(display));
}

CAMLprim value ml_gdk_surface_get_width(value surface_val)
{
    CAMLparam1(surface_val);
    GdkSurface *surface = GdkSurface_val(surface_val);
    int width = gdk_surface_get_width(surface);
    CAMLreturn(Val_int(width));
}

CAMLprim value ml_gdk_surface_get_height(value surface_val)
{
    CAMLparam1(surface_val);
    GdkSurface *surface = GdkSurface_val(surface_val);
    int height = gdk_surface_get_height(surface);
    CAMLreturn(Val_int(height));
}

CAMLprim value ml_gdk_surface_hide(value surface_val)
{
    CAMLparam1(surface_val);
    GdkSurface *surface = GdkSurface_val(surface_val);
    gdk_surface_hide(surface);
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gdk_surface_show(value surface_val)
{
    CAMLparam1(surface_val);
    GdkSurface *surface = GdkSurface_val(surface_val);
    /* Note: In GDK4, there's no direct gdk_surface_show().
     * Surfaces are shown through their GTK widgets. */
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gdk_surface_is_destroyed(value surface_val)
{
    CAMLparam1(surface_val);
    GdkSurface *surface = GdkSurface_val(surface_val);
    gboolean destroyed = gdk_surface_is_destroyed(surface);
    CAMLreturn(Val_bool(destroyed));
}

/* ========================================================================= */
/* Rectangle functions                                                       */
/* ========================================================================= */

CAMLprim value ml_gdk_rectangle_intersect(value rect1_val, value rect2_val)
{
    CAMLparam2(rect1_val, rect2_val);
    CAMLlocal1(result);
    GdkRectangle r1, r2, dest;

    r1.x = Int_val(Field(rect1_val, 0));
    r1.y = Int_val(Field(rect1_val, 1));
    r1.width = Int_val(Field(rect1_val, 2));
    r1.height = Int_val(Field(rect1_val, 3));

    r2.x = Int_val(Field(rect2_val, 0));
    r2.y = Int_val(Field(rect2_val, 1));
    r2.width = Int_val(Field(rect2_val, 2));
    r2.height = Int_val(Field(rect2_val, 3));

    if (gdk_rectangle_intersect(&r1, &r2, &dest)) {
        result = caml_alloc_small(4, 0);
        Field(result, 0) = Val_int(dest.x);
        Field(result, 1) = Val_int(dest.y);
        Field(result, 2) = Val_int(dest.width);
        Field(result, 3) = Val_int(dest.height);
        CAMLreturn(Val_some(result));
    }
    CAMLreturn(Val_none);
}

CAMLprim value ml_gdk_rectangle_union(value rect1_val, value rect2_val)
{
    CAMLparam2(rect1_val, rect2_val);
    CAMLlocal1(result);
    GdkRectangle r1, r2, dest;

    r1.x = Int_val(Field(rect1_val, 0));
    r1.y = Int_val(Field(rect1_val, 1));
    r1.width = Int_val(Field(rect1_val, 2));
    r1.height = Int_val(Field(rect1_val, 3));

    r2.x = Int_val(Field(rect2_val, 0));
    r2.y = Int_val(Field(rect2_val, 1));
    r2.width = Int_val(Field(rect2_val, 2));
    r2.height = Int_val(Field(rect2_val, 3));

    gdk_rectangle_union(&r1, &r2, &dest);

    result = caml_alloc_small(4, 0);
    Field(result, 0) = Val_int(dest.x);
    Field(result, 1) = Val_int(dest.y);
    Field(result, 2) = Val_int(dest.width);
    Field(result, 3) = Val_int(dest.height);

    CAMLreturn(result);
}

/* ========================================================================= */
/* Color functions                                                           */
/* ========================================================================= */

CAMLprim value ml_gdk_color_create(value red, value green, value blue)
{
    CAMLparam3(red, green, blue);
    /* GdkColor is deprecated in GDK4, use RGBA instead */
    ml_raise_gdk("GdkColor is deprecated in GDK4, use RGBA");
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gdk_color_get_red(value color_val)
{
    ml_raise_gdk("GdkColor is deprecated in GDK4, use RGBA");
    return Val_int(0);
}

CAMLprim value ml_gdk_color_get_green(value color_val)
{
    ml_raise_gdk("GdkColor is deprecated in GDK4, use RGBA");
    return Val_int(0);
}

CAMLprim value ml_gdk_color_get_blue(value color_val)
{
    ml_raise_gdk("GdkColor is deprecated in GDK4, use RGBA");
    return Val_int(0);
}

/* ========================================================================= */
/* RGBA functions                                                            */
/* ========================================================================= */

CAMLprim value ml_gdk_rgba_create(value red, value green, value blue, value alpha)
{
    CAMLparam4(red, green, blue, alpha);
    CAMLlocal1(result);
    GdkRGBA *rgba = g_new(GdkRGBA, 1);

    if (rgba == NULL) {
        ml_raise_gdk("Failed to allocate GdkRGBA");
    }

    rgba->red = Double_val(red);
    rgba->green = Double_val(green);
    rgba->blue = Double_val(blue);
    rgba->alpha = Double_val(alpha);

    result = Val_GdkRGBA(rgba);
    CAMLreturn(result);
}

CAMLprim value ml_gdk_rgba_get_red(value rgba_val)
{
    CAMLparam1(rgba_val);
    GdkRGBA *rgba = GdkRGBA_val(rgba_val);
    CAMLreturn(caml_copy_double(rgba->red));
}

CAMLprim value ml_gdk_rgba_get_green(value rgba_val)
{
    CAMLparam1(rgba_val);
    GdkRGBA *rgba = GdkRGBA_val(rgba_val);
    CAMLreturn(caml_copy_double(rgba->green));
}

CAMLprim value ml_gdk_rgba_get_blue(value rgba_val)
{
    CAMLparam1(rgba_val);
    GdkRGBA *rgba = GdkRGBA_val(rgba_val);
    CAMLreturn(caml_copy_double(rgba->blue));
}

CAMLprim value ml_gdk_rgba_get_alpha(value rgba_val)
{
    CAMLparam1(rgba_val);
    GdkRGBA *rgba = GdkRGBA_val(rgba_val);
    CAMLreturn(caml_copy_double(rgba->alpha));
}

CAMLprim value ml_gdk_rgba_to_string(value rgba_val)
{
    CAMLparam1(rgba_val);
    GdkRGBA *rgba = GdkRGBA_val(rgba_val);
    char *str = gdk_rgba_to_string(rgba);
    value result = caml_copy_string(str ? str : "");
    g_free(str);
    CAMLreturn(result);
}

CAMLprim value ml_gdk_rgba_parse(value str_val)
{
    CAMLparam1(str_val);
    GdkRGBA rgba;
    const char *str = String_val(str_val);

    if (gdk_rgba_parse(&rgba, str)) {
        GdkRGBA *result_rgba = g_new(GdkRGBA, 1);
        if (result_rgba == NULL) {
            ml_raise_gdk("Failed to allocate GdkRGBA");
        }
        *result_rgba = rgba;
        CAMLreturn(Val_some(Val_GdkRGBA(result_rgba)));
    }
    CAMLreturn(Val_none);
}

/* ========================================================================= */
/* Cursor functions                                                          */
/* ========================================================================= */

CAMLprim value ml_gdk_cursor_new_from_name(value name_val, value display_val)
{
    CAMLparam2(name_val, display_val);
    const char *name = String_val(name_val);
    GdkDisplay *display = GdkDisplay_val(display_val);
    /* Note: In GDK4, gdk_cursor_new_from_name takes display as first arg */
    GdkCursor *cursor = gdk_cursor_new_from_name(name, NULL);
    CAMLreturn(Val_option(cursor, Val_GdkCursor));
}

/* ========================================================================= */
/* Cairo functions                                                           */
/* ========================================================================= */

CAMLprim value ml_gdk_cairo_create(value surface_val)
{
    CAMLparam1(surface_val);
    /* In GDK4, cairo contexts are created differently.
     * Use gtk_snapshot for drawing in GTK4. */
    ml_raise_gdk("Direct cairo drawing changed in GDK4, use GtkSnapshot");
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gdk_cairo_set_source_rgba(value cairo_val, value rgba_val)
{
    CAMLparam2(cairo_val, rgba_val);
    cairo_t *cr = (cairo_t *)cairo_val;
    GdkRGBA *rgba = GdkRGBA_val(rgba_val);
    gdk_cairo_set_source_rgba(cr, rgba);
    CAMLreturn(Val_unit);
}
