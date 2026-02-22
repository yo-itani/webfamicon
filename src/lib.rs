pub mod cpu;

use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn greet() -> String {
    "Hello from WebFamicon (Rust + WASM)!".to_string()
}
