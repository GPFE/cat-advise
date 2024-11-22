import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["like", "dislike"]

  like() {
    this.likeTarget.setAttribute("style", "background-color: blue !important");
  }

  dislike() {
    this.dislikeTarget.setAttribute("style", "background-color: blue !important");
  }
}