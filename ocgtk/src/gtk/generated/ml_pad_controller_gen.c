/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PadController */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_pad_controller_set_action_entries(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
    int arg1_length = Wosize_val(arg1);
    GtkPadActionEntry* c_arg1 = (GtkPadActionEntry*)g_malloc(sizeof(GtkPadActionEntry) * arg1_length);
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = *GtkPadActionEntry_val(Field(arg1, i));
    }

gtk_pad_controller_set_action_entries(GtkPadController_val(self), c_arg1, Int_val(arg2));
    g_free(c_arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_pad_controller_set_action_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gtk_pad_controller_set_action(GtkPadController_val(self), GtkPadActionType_val(arg1), Int_val(arg2), Int_val(arg3), String_val(arg4), String_val(arg5));
CAMLreturn(Val_unit);}

CAMLexport CAMLprim value ml_gtk_pad_controller_set_action_bytecode(value * argv, int argn)
{
return ml_gtk_pad_controller_set_action_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}
