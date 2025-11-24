/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PadController */

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

/* Type-specific conversion macros for GtkPadController */
#define GtkPadController_val(val) ((GtkPadController*)ext_of_val(val))
#define Val_GtkPadController(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_pad_controller_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkPadController *obj = gtk_pad_controller_new(arg1, arg2);
CAMLreturn(Val_GtkPadController(obj));
}

CAMLexport CAMLprim value ml_gtk_pad_controller_set_action_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);


    gtk_pad_controller_set_action(GtkPadController_val(self), GtkPadActionType_val(arg1), Int_val(arg2), Int_val(arg3), String_val(arg4), String_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_pad_controller_set_action_bytecode(value * argv, int argn)
{
return ml_gtk_pad_controller_set_action_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}
