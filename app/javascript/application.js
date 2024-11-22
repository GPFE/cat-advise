// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
// app/javascript/application.js
import { Application } from "@hotwired/stimulus";
import LikeController from "./controllers/like_controller";

window.Stimulus = Application.start()
Stimulus.register("like", LikeController)
