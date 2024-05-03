#![no_std]
#![crate_type = "staticlib"]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[link(name = "myfunc")]
extern {
    fn myfunc(input: u64);
}

#[no_mangle]
pub extern "C" fn my_rust_func(input: u64) {
    let input = 1 << input;
    unsafe { myfunc(input) };
}
