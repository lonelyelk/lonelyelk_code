#include <ruby.h>

VALUE rb_mBlockThread;

/*
 * call-seq:
 *   BlockThread::cycle(interval=5)
 *
 * Блокирует текущий поток на <code>interval</code> секунд.
 *
 */

VALUE bt_cycle(int argc, VALUE *argv, VALUE self) {
  int i, max;
  max = 5;

  if (argc == 1) {
    max = FIX2INT(argv[0]);
  } else if (argc > 1) {
    rb_raise(rb_eArgError, "Неправильное количество аргументов (%d вместо 0 или 1)");
  }
  
  for (i=0; i<max; i++) {
    sleep(1);
  }
  return Qnil;
}

void Init_block_thread() {
  /*
   * Модуль содержит методы для демонстрации работы потока
   */
  rb_mBlockThread = rb_define_module("BlockThread");
  rb_define_module_function(rb_mBlockThread, "cycle", bt_cycle, -1);
}
