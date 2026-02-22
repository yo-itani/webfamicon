import './style.css'
import javascriptLogo from './javascript.svg'
import viteLogo from '/vite.svg'
import { setupCounter } from './counter.js'
import init, { greet } from '../pkg/webfamicon.js'

document.querySelector('#app').innerHTML = `
  <div>
    <a href="https://vite.dev" target="_blank">
      <img src="${viteLogo}" class="logo" alt="Vite logo" />
    </a>
    <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank">
      <img src="${javascriptLogo}" class="logo vanilla" alt="JavaScript logo" />
    </a>
    <h1>Hello Vite + WASM!</h1>
    <div class="card">
      <button id="counter" type="button"></button>
    </div>
    <div id="wasm-output" style="margin-top: 2rem; padding: 1rem; border: 1px solid #444; border-radius: 8px; background: #222;">
      Loading WASM...
    </div>
  </div>
`

setupCounter(document.querySelector('#counter'))

init().then(() => {
  const output = document.querySelector('#wasm-output');
  output.textContent = greet();
  output.style.color = '#4ade80';
}).catch(console.error);
