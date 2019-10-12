import css from "../css/app.css"

import "phoenix_html"

(function autoFocus() {
  var input = document.getElementById('user_input_typed')
  input.focus()
  input.addEventListener('focusout', function(e) { this.focus() })
})()



// assets/js/app.js
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

let liveSocket = new LiveSocket("/live", Socket)
liveSocket.connect()


