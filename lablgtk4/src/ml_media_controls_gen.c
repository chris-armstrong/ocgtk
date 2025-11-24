/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MediaControls */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_media_controls_new(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_media_controls_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_media_controls_set_media_stream(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_media_controls_set_media_stream(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_media_controls_get_media_stream(value self)
{
CAMLparam1(self);


    GtkMediaStream* result = gtk_media_controls_get_media_stream(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
