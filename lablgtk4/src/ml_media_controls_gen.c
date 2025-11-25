/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MediaControls */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkMediaControls */
#ifndef Val_GtkMediaControls
#define GtkMediaControls_val(val) ((GtkMediaControls*)ext_of_val(val))
#define Val_GtkMediaControls(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMediaControls */


CAMLexport CAMLprim value ml_gtk_media_controls_new(value arg1)
{
CAMLparam1(arg1);
GtkMediaControls *obj = gtk_media_controls_new(Option_val(arg1, GtkMediaStream_val, NULL));
CAMLreturn(Val_GtkMediaControls(obj));
}

CAMLexport CAMLprim value ml_gtk_media_controls_set_media_stream(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_media_controls_set_media_stream(GtkMediaControls_val(self), Option_val(arg1, GtkMediaStream_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_controls_get_media_stream(value self)
{
CAMLparam1(self);

GtkMediaStream* result = gtk_media_controls_get_media_stream(GtkMediaControls_val(self));
CAMLreturn(Val_option(result, Val_GtkMediaStream));
}
